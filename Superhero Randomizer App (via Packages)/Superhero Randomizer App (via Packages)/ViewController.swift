import UIKit
import Kingfisher

final class ViewController: UIViewController {

    // MARK: - IBOutlets (connect these in storyboard)
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var statsTextView: UITextView! // use UITextView for easier wrapping and scrolling
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Dependencies
    private let service = HeroService.shared
    private let storage = LastHeroStorage()
    private var heroes: [Hero] = []
    private var currentHero: Hero?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        restoreOrLoadHeroes()
    }

    private func configureUI() {
        title = "Superhero Randomizer"
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.layer.cornerRadius = 12

        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitleLabel.textColor = .secondaryLabel

        statsTextView.isEditable = false
        statsTextView.backgroundColor = .clear
        statsTextView.font = UIFont.systemFont(ofSize: 15)
        statsTextView.textContainer.lineBreakMode = .byWordWrapping

        randomButton.layer.cornerRadius = 10
        randomButton.backgroundColor = .systemBlue
        randomButton.setTitleColor(.white, for: .normal)

        activityIndicator.hidesWhenStopped = true
    }

    // MARK: - Restore or initial load
    private func restoreOrLoadHeroes() {
        // 1) Try to restore last hero object
        if let saved = storage.load() {
            display(hero: saved, animated: false)
            // Still load full list in background to enable Randomize offline or after restore
            service.fetchAllHeroes { result in
                switch result {
                case .success(let h):
                    self.heroes = h
                case .failure:
                    break
                }
            }
            return
        }

        // 2) No saved hero -> fetch all heroes, then show random
        loadAllHeroesAndShowRandom()
    }

    private func loadAllHeroesAndShowRandom() {
        setLoading(true)
        service.fetchAllHeroes { [weak self] result in
            guard let self = self else { return }
            self.setLoading(false)
            switch result {
            case .success(let heroes):
                self.heroes = heroes
                if let hero = heroes.randomElement() {
                    self.display(hero: hero, animated: false)
                }
            case .failure(let error):
                self.showError("Failed to load heroes: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Randomize action
    @IBAction func randomButtonTapped(_ sender: Any) {
        selectRandomHero()
    }

    private func selectRandomHero() {
        // if have local array use it; otherwise try service
        if !heroes.isEmpty {
            if let hero = heroes.randomElement() {
                display(hero: hero, animated: true)
            }
            return
        }

        setLoading(true)
        service.fetchRandomHero { [weak self] result in
            guard let self = self else { return }
            self.setLoading(false)
            switch result {
            case .success(let hero):
                self.display(hero: hero, animated: true)
            case .failure(let error):
                self.showError("Failed to fetch random hero: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Display hero (UI + persistence)
    private func display(hero: Hero, animated: Bool) {
        currentHero = hero
        // Persist selected hero
        storage.save(hero: hero)

        // Main text
        nameLabel.text = hero.name
        subtitleLabel.text = hero.biography.fullName?.isEmpty == false ? hero.biography.fullName : hero.slug

        // Build stats text with >=10 attributes
        let statsLines: [String] = [
            "Intelligence: \(hero.powerstats.intelligence?.description ?? "—")",
            "Strength: \(hero.powerstats.strength?.description ?? "—")",
            "Speed: \(hero.powerstats.speed?.description ?? "—")",
            "Durability: \(hero.powerstats.durability?.description ?? "—")",
            "Power: \(hero.powerstats.power?.description ?? "—")",
            "Combat: \(hero.powerstats.combat?.description ?? "—")",
            "Gender: \(hero.appearance.gender ?? "—")",
            "Race: \(hero.appearance.race ?? "—")",
            "Height: \(hero.appearance.height?.joined(separator: " / ") ?? "—")",
            "Weight: \(hero.appearance.weight?.joined(separator: " / ") ?? "—")",
            "Place of Birth: \(hero.biography.placeOfBirth ?? "—")",
            "Publisher: \(hero.biography.publisher ?? "—")",
            "Alignment: \(hero.biography.alignment ?? "—")",
            "Occupation: \(hero.work.occupation ?? "—")"
        ]

        let statsText = statsLines.joined(separator: "\n")
        // Animate text change if requested
        if animated {
            UIView.transition(with: statsTextView, duration: 0.28, options: .transitionCrossDissolve, animations: {
                self.statsTextView.text = statsText
            }, completion: nil)
        } else {
            statsTextView.text = statsText
        }

        // Image via Kingfisher (prefer lg -> md -> sm -> xs)
        if let urlStr = hero.images.lg ?? hero.images.md ?? hero.images.sm ?? hero.images.xs,
           let url = URL(string: urlStr) {
            // fade transition provided by Kingfisher
            let options: KingfisherOptionsInfo = [
                .transition(.fade(0.25)),
                .cacheOriginalImage
            ]
            heroImageView.kf.indicatorType = .activity
            heroImageView.kf.setImage(with: url, options: options) { result in
                switch result {
                case .success: break
                case .failure(let err):
                    print("Image load error:", err)
                    self.heroImageView.image = UIImage(systemName: "person.crop.rectangle")
                }
            }
        } else {
            heroImageView.image = UIImage(systemName: "person.crop.rectangle")
        }
    }

    // MARK: - UI helpers
    private func setLoading(_ loading: Bool) {
        DispatchQueue.main.async {
            if loading {
                self.activityIndicator.startAnimating()
                self.randomButton.isEnabled = false
                self.randomButton.alpha = 0.6
            } else {
                self.activityIndicator.stopAnimating()
                self.randomButton.isEnabled = true
                self.randomButton.alpha = 1.0
            }
        }
    }

    private func showError(_ message: String) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            ac.addAction(UIAlertAction(title: "Retry", style: .default) { _ in
                self.loadAllHeroesAndShowRandom()
            })
            self.present(ac, animated: true)
        }
    }
}


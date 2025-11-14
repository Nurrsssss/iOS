//
//  ViewController.swift
//  MyFavorites
//
//  Created by Nursultan Tolegen on 14.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    /// Section titles for the table view
    private let sectionTitles = [
        "Favorite Movies",
        "Favorite Music",
        "Favorite Books",
        "Favorite University Courses"
    ]
    
    /// Emojis for custom section headers
    private let sectionEmojis = ["🎬", "🎵", "📚", "🎓"]
    
    /// Data source: Array of arrays, where each inner array represents a section
    private var favoritesData: [[FavoriteItem]] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    
    /// Configures the UI appearance
    private func setupUI() {
        view.backgroundColor = .systemGroupedBackground
        title = "My Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure table view appearance
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGroupedBackground
    }
    
    /// Sets up the table view delegate, data source, and configuration
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.sectionHeaderHeight = 50
        tableView.contentInsetAdjustmentBehavior = .automatic
    }
    
    /// Initializes sample data for all four sections
    private func setupData() {
        // Section 0: Favorite Movies
        let movies = [
            FavoriteItem(
                title: "The Shawshank Redemption",
                subtitle: "Directed by Frank Darabont (1994)",
                review: "A masterpiece of storytelling that explores hope, friendship, and redemption. The character development is exceptional, and the ending is one of the most satisfying in cinema history.",
                imageName: "Unknown-5"
            ),
            FavoriteItem(
                title: "Inception",
                subtitle: "Directed by Christopher Nolan (2010)",
                review: "A mind-bending thriller that challenges your perception of reality. The visual effects are stunning, and the layered narrative keeps you engaged from start to finish.",
                imageName: "Inception_(2010)_theatrical_poster"
            ),
            FavoriteItem(
                title: "The Dark Knight",
                subtitle: "Directed by Christopher Nolan (2008)",
                review: "Heath Ledger's performance as the Joker is legendary. This film redefined what a superhero movie could be, combining action with deep psychological themes.",
                imageName: "Unknown-6"
            ),
            FavoriteItem(
                title: "Pulp Fiction",
                subtitle: "Directed by Quentin Tarantino (1994)",
                review: "A non-linear narrative masterpiece with unforgettable dialogue and characters. Tarantino's unique style and storytelling make this a timeless classic.",
                imageName: "Unknown-7"
            ),
            FavoriteItem(
                title: "Interstellar",
                subtitle: "Directed by Christopher Nolan (2014)",
                review: "A beautiful exploration of love, time, and humanity's place in the universe. The scientific accuracy combined with emotional depth creates an unforgettable experience.",
                imageName: "Unknown-8"
            )
        ]
        
        // Section 1: Favorite Music
        let music = [
            FavoriteItem(
                title: "Abbey Road",
                subtitle: "The Beatles (1969)",
                review: "The perfect blend of rock, pop, and experimental sounds. Every track is a masterpiece, and the medley on side two is one of the greatest achievements in music history.",
                imageName: "Unknown-9"
            ),
            FavoriteItem(
                title: "Dark Side of the Moon",
                subtitle: "Pink Floyd (1973)",
                review: "A concept album that explores themes of life, death, and mental health. The production quality and cohesive flow make it a timeless work of art.",
                imageName: "Unknown-10"
            ),
            FavoriteItem(
                title: "Kind of Blue",
                subtitle: "Miles Davis (1959)",
                review: "The quintessential jazz album that defined modal jazz. Every musician on this record is at the top of their game, creating something truly magical.",
                imageName: "Unknown-11"
            ),
            FavoriteItem(
                title: "Rumours",
                subtitle: "Fleetwood Mac (1977)",
                review: "An album born from personal turmoil that resulted in perfect pop songs. The harmonies, songwriting, and production create an emotionally resonant experience.",
                imageName: "Unknown-12"
            ),
            FavoriteItem(
                title: "To Pimp a Butterfly",
                subtitle: "Kendrick Lamar (2015)",
                review: "A powerful exploration of race, identity, and American culture. The fusion of jazz, funk, and hip-hop creates a unique and thought-provoking sound.",
                imageName: "Unknown-13"
            )
        ]
        
        // Section 2: Favorite Books
        let books = [
            FavoriteItem(
                title: "1984",
                subtitle: "George Orwell (1949)",
                review: "A prophetic dystopian novel that remains relevant today. Orwell's vision of totalitarianism and surveillance is both terrifying and thought-provoking.",
                imageName: "Unknown-14"
            ),
            FavoriteItem(
                title: "The Great Gatsby",
                subtitle: "F. Scott Fitzgerald (1925)",
                review: "A beautifully written novel about the American Dream and its illusions. Fitzgerald's prose is poetic, and the symbolism throughout is masterful.",
                imageName: "Unknown-15"
            ),
            FavoriteItem(
                title: "Sapiens",
                subtitle: "Yuval Noah Harari (2011)",
                review: "A fascinating exploration of human history and how we came to dominate the planet. Harari's ability to connect different disciplines makes this a compelling read.",
                imageName: "Unknown-16"
            ),
            FavoriteItem(
                title: "The Catcher in the Rye",
                subtitle: "J.D. Salinger (1951)",
                review: "Holden Caulfield's voice is unforgettable. This coming-of-age story captures the confusion and alienation of adolescence in a way that still resonates.",
                imageName: "Unknown-17"
            ),
            FavoriteItem(
                title: "Dune",
                subtitle: "Frank Herbert (1965)",
                review: "An epic science fiction masterpiece with rich world-building and complex themes. The political intrigue, ecology, and philosophy make it a truly immersive experience.",
                imageName: "Unknown-18"
            )
        ]
        
        // Section 3: Favorite University Courses
        let courses = [
            FavoriteItem(
                title: "Data Structures and Algorithms",
                subtitle: "CS 201 - Computer Science",
                review: "This course fundamentally changed how I think about problem-solving. Learning about time complexity and different data structures opened up a whole new way of approaching programming challenges.",
                imageName: "Unknown"
            ),
            FavoriteItem(
                title: "Introduction to Psychology",
                subtitle: "PSY 101 - Psychology",
                review: "Fascinating insights into human behavior and the mind. The course covered everything from cognitive processes to social psychology, giving me a better understanding of myself and others.",
                imageName: "Unknown-19"
            ),
            FavoriteItem(
                title: "Linear Algebra",
                subtitle: "MATH 301 - Mathematics",
                review: "Beautiful mathematical concepts that have applications everywhere. Understanding vector spaces and transformations gave me a new perspective on how to model real-world problems.",
                imageName: "Unknown-20"
            ),
            FavoriteItem(
                title: "Software Engineering",
                subtitle: "CS 350 - Computer Science",
                review: "Learning about design patterns, testing, and project management was invaluable. This course taught me how to write maintainable code and work effectively in teams.",
                imageName: "Unknown-1"
            ),
            FavoriteItem(
                title: "Philosophy of Mind",
                subtitle: "PHIL 250 - Philosophy",
                review: "Deep questions about consciousness, free will, and the nature of the mind. This course challenged my assumptions and made me think more critically about fundamental questions.",
                imageName: "Unknown-21"
            )
        ]
        
        favoritesData = [movies, music, books, courses]
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < favoritesData.count else { return 0 }
        return favoritesData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoriteTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        guard indexPath.section < favoritesData.count,
              indexPath.row < favoritesData[indexPath.section].count else {
            return cell
        }
        
        let item = favoritesData[indexPath.section][indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section < sectionTitles.count else { return nil }
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12 // Spacing between sections
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView() // Empty footer for spacing
    }
    
    // MARK: - Custom Section Headers (Bonus)
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section < sectionTitles.count && section < sectionEmojis.count else {
            return nil
        }
        
        let headerView = UIView()
        headerView.backgroundColor = .systemGroupedBackground
        
        // Container view with rounded corners and background
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBlue.withAlphaComponent(0.1)
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        
        // Emoji label
        let emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.text = sectionEmojis[section]
        emojiLabel.font = .systemFont(ofSize: 24)
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = sectionTitles[section]
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        
        // Add subviews
        headerView.addSubview(containerView)
        containerView.addSubview(emojiLabel)
        containerView.addSubview(titleLabel)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Container view constraints
            containerView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -4),
            
            // Emoji label constraints
            emojiLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            emojiLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            // Title label constraints
            titleLabel.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -16)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

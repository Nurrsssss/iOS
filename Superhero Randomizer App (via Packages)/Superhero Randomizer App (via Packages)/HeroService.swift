import Foundation
import Alamofire

final class HeroService {
    static let shared = HeroService()
    private init() {}

    private let allURL = "https://akabab.github.io/superhero-api/api/all.json"
    private var cachedHeroes: [Hero]?
    private let queue = DispatchQueue(label: "HeroServiceQueue", qos: .userInitiated)

    // Fetch all heroes and cache them in memory. Completion on main queue.
    func fetchAllHeroes(forceReload: Bool = false, completion: @escaping (Result<[Hero], Error>) -> Void) {
        queue.async {
            if let cached = self.cachedHeroes, !forceReload {
                DispatchQueue.main.async { completion(.success(cached)) }
                return
            }

            AF.request(self.allURL).validate().responseDecodable(of: [Hero].self) { response in
                switch response.result {
                case .success(let heroes):
                    self.cachedHeroes = heroes
                    completion(.success(heroes))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    // Return random hero from cached list (or fetch first if needed)
    func fetchRandomHero(completion: @escaping (Result<Hero, Error>) -> Void) {
        fetchAllHeroes { result in
            switch result {
            case .success(let heroes):
                guard !heroes.isEmpty else {
                    completion(.failure(NSError(domain: "HeroService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No heroes available"])))
                    return
                }
                // true randomness
                let hero = heroes.randomElement()!
                completion(.success(hero))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // Get hero by ID (useful to restore from last saved ID - optional)
    func heroByID(_ id: Int, completion: @escaping (Result<Hero, Error>) -> Void) {
        // if cached, search there
        fetchAllHeroes { result in
            switch result {
            case .success(let heroes):
                if let hero = heroes.first(where: { $0.id == id }) {
                    completion(.success(hero))
                } else {
                    completion(.failure(NSError(domain: "HeroService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Hero not found"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

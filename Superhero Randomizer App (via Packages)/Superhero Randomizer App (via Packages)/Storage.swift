import Foundation

enum StorageKey {
    static let lastHero = "com.example.superhero.lastHero"
}

struct LastHeroStorage {
    private let defaults: UserDefaults
    init(userDefaults: UserDefaults = .standard) {
        self.defaults = userDefaults
    }

    func save(hero: Hero) {
        do {
            let data = try JSONEncoder().encode(hero)
            defaults.set(data, forKey: StorageKey.lastHero)
        } catch {
            print("Failed to encode hero for storage:", error)
        }
    }

    func load() -> Hero? {
        guard let data = defaults.data(forKey: StorageKey.lastHero) else { return nil }
        do {
            return try JSONDecoder().decode(Hero.self, from: data)
        } catch {
            print("Failed to decode hero from storage:", error)
            return nil
        }
    }

    func clear() {
        defaults.removeObject(forKey: StorageKey.lastHero)
    }
}

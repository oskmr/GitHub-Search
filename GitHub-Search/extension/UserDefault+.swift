import Foundation

extension UserDefaults {
    func set<T: Codable>(object: T, forKey: String) throws {
        let jsonData = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey)
        synchronize()
    }

    func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        return try JSONDecoder().decode(objectType, from: result)
    }

    func saveModel(model: GithubEntity) {
        do {
            try UserDefaults.standard.set(object: model, forKey: "key")
        } catch {
            print(error)
        }
    }

    func getModel() -> GithubEntity? {
        do {
            return try UserDefaults.standard.get(objectType: GithubEntity.self, forKey: "key")
        } catch {
            print(error)
            return nil
        }
    }

}

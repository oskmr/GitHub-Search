//
//  UserDefault+.swift
//  GitHub-Search
//
//  Created by 千葉大志 on 2021/02/25.
//

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
}

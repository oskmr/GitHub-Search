//
//  ListModel.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import Foundation

struct ListResponse: Codable {
  let items: [GithubListEntity]?
}

struct GithubListEntity: Codable {
    let id: Int
    let name: String
    let fullName: String
    let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case htmlURL = "html_url"
    }
}


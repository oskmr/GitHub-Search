//
//  GithubModel.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/23.
//

struct GithubResponse: Codable {
  let items: [GithubEntity]?
}

struct GithubEntity: Codable {
  let id: Int
  let name: String
  private let fullName: String
  var urlStr: String { "https://github.com/\(fullName)" }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case fullName = "full_name"
  }

}

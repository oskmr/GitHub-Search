//
//  Mock.swift
//  GitHub-SearchTests
//
//  Created by OsakaMiseri on 2021/03/04.
//

import Foundation

class Mock {

    static func listViewModelMock() -> [GithubListEntity] {
        let fullName: String = "testFullName"
        let htmlURL: String = "testHtmlURL"

        var gitHubListEntity = GithubListEntity(id: 1, name: "name", fullName: fullName, htmlURL: htmlURL)


        return [gitHubListEntity]
    }
}

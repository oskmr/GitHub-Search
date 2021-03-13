//
//  GithubSearchViewModelTest.swift
//  GitHub-SearchTests
//
//  Created by OsakaMiseri on 2021/03/14.
//

@testable import GitHub_Search
import XCTest

class GithubSearchViewModelTest: XCTestCase {

    func test() {
        let dependency = Dependency()
        let viewModel = dependency.testTarget
    }

}

private extension GithubSearchViewModelTest {

    struct Dependency {
        let testTarget: GithubSearchViewModel
        init() {
            self.testTarget = .init()
        }
    }

}

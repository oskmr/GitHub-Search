//
//  GithubListViewModelTest.swift
//  GitHub-SearchTests
//
//  Created by OsakaMiseri on 2021/03/14.
//

@testable import GitHub_Search
import XCTest

class GithubListViewModelTest: XCTestCase {
    func testBannerSetting() {
        let dependency = Dependency()
        let viewModel = dependency.testTarget
    }
}

private extension GithubListViewModelTest {
    struct Dependency {
        let testTarget: GithubListViewModel
        init() {
            self.testTarget = .init()
        }
    }
}

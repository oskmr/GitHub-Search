//
//  GithubSearchViewModelTest.swift
//  GitHub-SearchTests
//
//  Created by osakamiseri on 2021/03/03.
//

@testable import GitHub_Search
import XCTest

final class GithubSearchViewModelTest: XCTestCase {
    // changeModelsObservable時にデータ取得の完了通知が正常に流れていることをテストする
    // searchTextObserver時にデータの変化取得の完了通知が正常に流れていることをテストする
    // sortTypeObserver時にデータの変化取得の完了通知が正常に流れていることをテストする

    func test_changeModelsObservable() {
        let dependency = Dependency()
        let viewModel = dependency.testTarget
    }

    func test_searchTextObserver() {
        let dependency = Dependency()
        let viewModel = dependency.testTarget
    }

    func test_sortTypeObserver() {
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

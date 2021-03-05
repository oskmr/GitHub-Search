//
//  GithubListViewModelTest.swift
//  GitHub-SearchTests
//
//  Created by osakamiseri on 2021/03/03.
//

@testable import GitHub_Search
import XCTest
import RxSwift

final class GithubListViewModelTest: XCTestCase {
    // changeModelsObservable時にデータ取得の完了通知が正常に流れていることをテストする？

    func test_changeModelsObservable() {
        let dependency = Dependency()
        let viewModel = dependency.testTarget
        let mock = Mock.listViewModelMock()
        // let changeModelsObservable = viewModel.changeModelsObservable.map { true }
        // viewModel.changeModelsObservable.onNext(())


        // XCTAssertEqual(changeModelsObservable.value, true, "changeModelsObservable時にデータ取得の完了通知が正常に流れている")
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

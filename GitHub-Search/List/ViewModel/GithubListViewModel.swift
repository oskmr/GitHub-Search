//
//  ListViewModel.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import RxSwift
import RxCocoa

protocol GithubListViewModelInput {
    var getListObserver: AnyObserver<Void> { get }
}

protocol GithubListViewModelOutput {
    var changeModelsObservable: Observable<Void> { get }
    var models: [GithubListEntity] { get }
}

final class GithubListViewModel:  GithubListViewModelInput, GithubListViewModelOutput {

    private let disposeBag = DisposeBag()
    private let _getListObserver = PublishSubject<Void>()
    private(set) lazy var getListObserver: AnyObserver<Void> = _getListObserver.asObserver()
    private let _changeModelsObservable = PublishRelay<Void>()
    lazy var changeModelsObservable = _changeModelsObservable.asObservable()
    private(set) var models: [GithubListEntity] = []

    init() {
        GithubListAPI.shared.rx.get(completion: {models in
            print(models)
        }).map {[weak self] (models) -> Void in
            self?.models = models
            return
        }.bind(to: _changeModelsObservable).disposed(by: disposeBag)
    }
}

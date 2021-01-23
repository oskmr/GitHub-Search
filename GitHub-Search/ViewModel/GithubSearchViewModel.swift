//
//  GithubSearchViewModel.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/23.
//

import RxSwift
import RxCocoa

protocol GithubSearchViewModelInput {
    var searchTextObserver: AnyObserver<String> { get }
    var sortTypeObserver: AnyObserver<Bool> { get }
}

protocol GithubSearchViewModelOutput {
    var changeModelsObservable: Observable<Void> { get }
    var models: [GithubModel] { get }
}

final class GithubSearchViewModel: GithubSearchViewModelInput, GithubSearchViewModelOutput {

    let disposeBag = DisposeBag()
    private let _searchText = PublishRelay<String>()
    lazy var searchTextObserver: AnyObserver<String> = .init(eventHandler: { (event) in
        guard let e = event.element else { return }
        self._searchText.accept(e)
    })
    private let _sortType = PublishRelay<Bool>()
    lazy var sortTypeObserver: AnyObserver<Bool> = .init(eventHandler: { (event) in
        guard let e = event.element else { return }
        self._sortType.accept(e)
    })
    private let _changeModelsObservable = PublishRelay<Void>()
    lazy var changeModelsObservable = _changeModelsObservable.asObservable()
    private(set) var models: [GithubModel] = []

    init() {
        Observable.combineLatest(
            _searchText,
            _sortType
        ).flatMapLatest({ (searchWord, sortType) -> Observable<[GithubModel]> in
            GithubAPI.shared.rx.get(searchWord: searchWord, isDesc: sortType)
        }).map {[weak self] (models) -> Void in
            self?.models = models
            return
        }.bind(to: _changeModelsObservable).disposed(by: disposeBag)
    }

}

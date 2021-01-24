//
//  ListViewModel.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import RxSwift
import RxCocoa

protocol ListViewModelInput {
    var getListObserver: AnyObserver<Void> { get }
}

protocol ListViewModelOutput {
    var changeModelsObservable: Observable<Void> { get }
    var models: [ListModel] { get }
}

final class ListViewModel:  ListViewModelInput, ListViewModelOutput {

    private let disposeBag = DisposeBag()
    private let _getListObserver = PublishSubject<Void>()
    private(set) lazy var getListObserver: AnyObserver<Void> = _getListObserver.asObserver()
    private let _changeModelsObservable = PublishRelay<Void>()
    lazy var changeModelsObservable = _changeModelsObservable.asObservable()
    private(set) var models: [ListModel] = []

    init() {
        ListAPI.shared.rx.get(completion: {models in
            print(models)
        }).map {[weak self] (models) -> Void in
            self?.models = models
            return
        }.bind(to: _changeModelsObservable).disposed(by: disposeBag)
    }

}

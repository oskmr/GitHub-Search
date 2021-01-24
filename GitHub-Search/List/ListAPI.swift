//
//  ListAPI.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import Alamofire
import RxSwift

final class ListAPI {
    static let shared = ListAPI()

    private init() {}

    func get(success: (([ListModel]) -> Void)? = nil, error: ((Error)->Void)? = nil) {
        AF.request("https://api.github.com/search/repositories?q=swift&sort=stars&page=1&per_page=50").response { (response) in
            switch response.result {
            case .success:
                guard
                    let data = response.data,
                    let githubResponse = try? JSONDecoder().decode(ListResponse.self, from: data),
                    let models = githubResponse.items
                else
                {
                    success?([])
                    return
                }
                success?(models)
            case .failure(let err):
                error?(err)
            }
        }
    }

}

extension ListAPI: ReactiveCompatible {}
extension Reactive where Base: ListAPI {
    func get(completion: ([ListModel]) -> Void) -> Observable<[ListModel]> {
        return Observable.create { observer in
            ListAPI.shared.get(success: { (models) in
                observer.on(.next(models))
            })
            return Disposables.create()
        }.share()
    }
}


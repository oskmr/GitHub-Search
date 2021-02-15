//
//  GithubSearchViewController.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/23.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

final class GithubSearchViewController: UIViewController {

    private var bookMarkBarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var sortTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "GithubTableViewCell", bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    private let disposeBag = DisposeBag()
    private let viewModel = GithubSearchViewModel()
    private lazy var input: GithubSearchViewModelInput = viewModel
    private lazy var output: GithubSearchViewModelOutput = viewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        bindInputStream()
        bindOutputStream()
        bookMarkBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookMarkButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [bookMarkBarButtonItem]
    }

    @objc func bookMarkButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "BookMark", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "BookMarkViewController")
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    private func bindInputStream() {
        // 0.2以上,変化している,nilじゃない,文字数0以上だったらテキストを流す
        let searchTextObservable = searchTextField.rx.text
            .debounce(RxTimeInterval.milliseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged().filterNil().filter { $0.isNotEmpty }
        // ここのfilterNil消す書き方にできる？

        let sortTypeObservable = Observable.merge(
            Observable.just(sortTypeSegmentedControl.selectedSegmentIndex),
            sortTypeSegmentedControl.rx.controlEvent(.valueChanged)
                .map { self.sortTypeSegmentedControl.selectedSegmentIndex }
        ).map { $0 == 0 }
        searchTextObservable.bind(to: input.searchTextObserver).disposed(by: disposeBag)
        sortTypeObservable.bind(to: input.sortTypeObserver).disposed(by: disposeBag)
    }

    private func bindOutputStream() {
        output
            .changeModelsObservable
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: {
            self.tableView.reloadData()
        }, onError: { error in
            print(error.localizedDescription)
        })
        .disposed(by: disposeBag)
    }

}

extension GithubSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let githubModel = output.models[safe: indexPath.item],
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GithubTableViewCell
        else { return UITableViewCell() }
        cell.prepareUI(githubModel: githubModel)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? GitHubWebViewController
        searchVC?.hoge(gitHubEntity: output.models[safe: indexPath.item]!)
        navigationController!.pushViewController(searchVC!, animated: true)
    }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let bookMarkAction = UIContextualAction(style: .normal, title: "ブックマーク") { (action, view, completionHandler) in
            
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [bookMarkAction])
    }

}

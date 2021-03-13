//
//  ListViewController.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import UIKit
import RxSwift

class GithubListViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private let viewModel = GithubListViewModel()
    private lazy var input: GithubListViewModelInput = viewModel
    private lazy var output: GithubListViewModelOutput = viewModel

    @IBAction func searchButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "GithubSearchViewController")
        navigationController?.pushViewController(searchVC, animated: true)
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "ListTableViewCell", bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindOutputStream()
        self.navigationItem.title = "Repositories"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getListObserver.onNext(())
    }

    private func bindOutputStream() {
        output.changeModelsObservable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension GithubListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let listModel = output.models[safe: indexPath.item],
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListTableViewCell
        else { return UITableViewCell() }
        cell.prepareUI(listModel: listModel)

        return cell
    }

}

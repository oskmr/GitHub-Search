//
//  BookMarkViewController.swift
//  GitHub-Search
//
//  Created by OsakaMiseri on 2021/02/10.
//

import UIKit

class BookMarkViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            let cell = UINib(nibName: "BookMarkTableViewCell", bundle: nil)
            tableView.register(cell, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ブックマーク"
    }

}

extension BookMarkViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getModel()?.name.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BookMarkTableViewCell
        else { return UITableViewCell() }
        cell.prepareUI()

        return cell
    }

    func getModel() -> GithubEntity? {
        do {
            return try UserDefaults.standard.get(objectType: GithubEntity.self, forKey: "key")
        } catch {
            print(error)
            return nil
        }
    }

}

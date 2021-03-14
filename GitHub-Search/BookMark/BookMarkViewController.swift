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
        return getBookMarks()?.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? BookMarkTableViewCell
        else { return UITableViewCell() }

        if let bookMark = getBookMarks()?.items?[indexPath.row] {
            cell.setAttributes(title: bookMark.name, url: bookMark.urlStr)
        }
        return cell
    }

    func getBookMarks() -> GithubResponse? {
        do {
            return try UserDefaults.standard.get(objectType: GithubResponse.self, forKey: "bookMarks")
        } catch {
            print(error)
            return nil
        }
    }

}

//
//  GithubTableViewCell.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/23.
//

import UIKit

final class GithubTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!

    func prepareUI(githubModel: GithubEntity) {
        titleLabel.text = githubModel.name
        urlLabel.text = githubModel.urlStr
    }

}

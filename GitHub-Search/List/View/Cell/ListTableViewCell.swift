//
//  ListTableViewCell.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var url: UILabel!

    func prepareUI(listModel: GithubListEntity) {
        title.text = listModel.name
        url.text = listModel.htmlURL
    }
    
}

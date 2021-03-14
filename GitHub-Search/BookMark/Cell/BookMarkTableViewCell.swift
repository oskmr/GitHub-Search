//
//  BookMarkTableViewCell.swift
//  GitHub-Search
//
//  Created by OsakaMiseri on 2021/02/10.
//

import UIKit

final class BookMarkTableViewCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var url: UILabel!

    func setAttributes(title: String, url: String) {
        self.title.text = title
        self.url.text = url
    }

}

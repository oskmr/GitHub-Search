//
//  BookMarkTableViewCell.swift
//  GitHub-Search
//
//  Created by OsakaMiseri on 2021/02/10.
//

import UIKit

class BookMarkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var url: UILabel!

    func setAttributes(title: String, url: String) {
        self.title.text = title
        self.url.text = url
    }

}

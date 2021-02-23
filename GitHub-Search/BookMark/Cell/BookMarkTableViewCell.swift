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

    static func bookMarkData(forKey key: String) -> String {
        let data = UserDefaults.standard.object(forKey: key) as? Data
        let unarchiveObject = NSKeyedUnarchiver.unarchiveObject(with: data!)

        return ""
    }

    func prepareUI() {
        title.text = BookMarkTableViewCell.bookMarkData(forKey: "key")
        url.text = BookMarkTableViewCell.bookMarkData(forKey: "key")
    }

}

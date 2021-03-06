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

    /*
    func bookMarkData(forKey key: String) -> String {
        let data = UserDefaults.standard.object(forKey: key) as? Data
        let unarchiveObject = NSKeyedUnarchiver.unarchiveObject(with: data!)

        return ""
    }
    */

    func getModel() -> GithubEntity? {
        do {
            return try UserDefaults.standard.get(objectType: GithubEntity.self, forKey: "key")
        } catch {
            print(error)
            return nil
        }
    }

    func prepareUI() {
        // let bookMarkList = getModel()
        title.text = getModel()?.name
        url.text = getModel()?.urlStr
    }

}

//
//  Array+.swift
//  GitHub-Search
//
//  Created by 逢坂 美芹 on 2021/01/23.
//

extension Array {
  subscript (safe index: Int) -> Element? {
    return index >= 0 && index < self.count ? self[index] : nil
  }
}

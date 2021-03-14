// 
//  GitHubWebViewController.swift
//  GitHub-Search
//
//  Created by OsakaMiseri on 2021/02/08.
//

import UIKit
import WebKit

class GitHubWebViewController: UIViewController, WKNavigationDelegate {

    private var gitHubEntity: GithubEntity?
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: gitHubEntity?.urlStr ?? "https://github.co.jp/") {
            self.webView.load(URLRequest(url: url))
        }
    }

    func hoge(gitHubEntity: GithubEntity) {
        self.gitHubEntity = gitHubEntity
    }

}

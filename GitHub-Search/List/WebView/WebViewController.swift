//
//  WebViewController.swift
//  GitHub-Search
//
//  Created by OsakaMiseri on 2021/02/08.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    private var url: String = "https://github.com/miserii"
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: url) {
            self.webView.load(URLRequest(url: url))
        }
    }
    
}

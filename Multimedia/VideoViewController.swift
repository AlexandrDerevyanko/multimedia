//
//  VideoViewController.swift
//  Multimedia
//
//  Created by Aleksandr Derevyanko on 08.03.2023.
//

import UIKit
import WebKit

class VideoViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var myURL = URL(string:"https://www.apple.com")
    lazy var myRequest = URLRequest(url: myURL!)
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        webView.load(myRequest)
    }
    
    func setup(link: String) {
        myURL = URL(string: link)
    }
    
}

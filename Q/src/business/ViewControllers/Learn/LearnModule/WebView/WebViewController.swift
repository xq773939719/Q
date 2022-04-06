//
//  WebViewController.swift
//  Q
//
//  Created by XQ on 2022/4/6.
//

import UIKit
import SnapKit
import WebKit

class WebViewController: BaseViewController, WKUIDelegate {
    
    override class func scheme() -> String {
        return "q://vc/webview"
    }
    
    lazy var webView: BaseWebView = {
        
        let webConfiguration = WKWebViewConfiguration()
        let webView = BaseWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view?.backgroundColor = UIColor.clear
        return webView
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(self.webView)
        self.webView.snp.makeConstraints { make in
            make.size.equalTo(self.rootContainer)
        }
        let url = URL(string: "https://google.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
}

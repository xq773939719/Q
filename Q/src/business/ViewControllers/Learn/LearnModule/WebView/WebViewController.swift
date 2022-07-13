//
//  WebViewController.swift
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
        return webView
    }()
    
    override func setupViews() {
        super.setupViews()
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp_topMargin)
            make.bottom.left.right.equalTo(self.view)
        }
        let url = URL(string: "https://www.bilibili.com")
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
}

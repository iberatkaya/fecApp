//
//  WebViewController.swift
//  fecApp
//
//  Created by Ibrahim Berat Kaya on 11/6/22.
//

import UIKit
import WebKit
import SnapKit

class WebViewController: UIViewController {
    let url: String
    
    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        loadUrl(url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(webView)
        
        webView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
        
    var webView: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    func loadUrl(_ url: String) {
        let link = URL(string: url)!
        let request = URLRequest(url: link)
        webView.load(request)
    }
}

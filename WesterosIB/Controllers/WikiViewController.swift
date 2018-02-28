//
//  WikiViewController.swift
//  WesterosIB
//
//  Created by Irma Blanco on 28/02/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit
import WebKit


class WikiViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    // Mark: - Properties
    let model: House
    
    // Mark: - Inicialization
    
    init(model: House) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = false
        loadingView.startAnimating()
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        title = model.name
        webView.load(URLRequest(url: model.wikiURL))
    }
}

extension WikiViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
        loadingView.isHidden = true
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated,.formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}






















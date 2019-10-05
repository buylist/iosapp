//
//  LoginWebkitViewController.swift
//  BuyList
//
//  Created by m on 05/10/2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit
import WebKit

protocol LoginWebkitViewControllerDelegate: class {
    func didReceive(token: String)
}

class LoginWebkitViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView!
    
    private weak var delegate: LoginWebkitViewControllerDelegate?
    private var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupWebView()
    }
    
    func setup(url: URL, delegate: LoginWebkitViewControllerDelegate) {
        self.url = url
        self.delegate = delegate
    }
    
    private func setupWebView() {
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
    }
    
    private func tryToGrabToken() {
        webView.evaluateJavaScript("document.body.innerHTML") { [weak self] (response, error) in
            guard let response = response as? String,
                let responseData = response.data(using: .utf8),
                let tokenCodable = try? JSONDecoder().decode(TokenCodable.self, from: responseData) else { return }
            self?.navigationController?.popViewController(animated: true)
            self?.delegate?.didReceive(token: tokenCodable.token)
        }
    }
}

extension LoginWebkitViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let currentUrl = webView.url?.absoluteString else { return }
        if currentUrl.hasPrefix("http://www.buy-list.cloud/accounts/profile/?state=") {
            tryToGrabToken()
        }
    }
}

//
//  GithubLoginViewController.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import WebKit
import Combine

protocol GithubLoginViewControllerDelegate: NSObject {
    func loginCompleted()
}

final class GithubLoginViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier: String = "GithubLoginViewController"
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    weak var delegate: GithubLoginViewControllerDelegate?
    var cancellable: AnyCancellable?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: Endpoint(path: .githubLogin).url!))
    }
}

extension GithubLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url,
            url == Endpoint(path: .compared).url else {
                decisionHandler(.allow)
                
                return
        }
        decisionHandler(.cancel)
        cancellable = WKWebView.TokenPublisher()
            .sink(receiveCompletion: { _ in }) { token in
                UserDefaults.standard
                    .set(token,
                         forKey: "token")
        }
        dismiss(animated: true) { [weak self] in
            self?.delegate?.loginCompleted()
        }
    }
}

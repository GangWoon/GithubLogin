//
//  WKWebView.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import WebKit

extension WKWebView {
    var httpCookieStore: WKHTTPCookieStore {
        return WKWebsiteDataStore.default().httpCookieStore
    }
    
    func getToken(for domain: String? = nil, completion: @escaping (String) -> Void) {
        httpCookieStore.getAllCookies { cookies in
            guard let token = cookies
                .filter({ $0.name == "jwt" }).first?.value else { return }
            completion(token)
        }
    }
}


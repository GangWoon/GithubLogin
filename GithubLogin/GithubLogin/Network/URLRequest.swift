//
//  URLRequest.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

enum HTTPMethod: CustomStringConvertible {
    
    case GET
    
    var description: String {
        switch self {
        case .GET:
            return "GET"
        }
    }
}

extension URLRequest {
    init(url: URL, method: HTTPMethod, token: String? = nil) {
        self.init(url: url)
        setValue("application/json",
                 forHTTPHeaderField: "Content-Type")
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        setValue("jwt=\(token)",
            forHTTPHeaderField: "Cookie")
    }
}

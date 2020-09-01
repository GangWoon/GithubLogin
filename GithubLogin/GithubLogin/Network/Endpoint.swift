//
//  Endpoint.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol RequestProviding {
    var url: URL? { get }
    var baseUrl: String { get }
    var scheme: String { get }
    var path: Endpoint.Path { get }
}

struct Endpoint: RequestProviding {
    
    enum Path: CustomStringConvertible {

        case githubLogin
        case labels
        case compared
        
        var description: String {
            switch self {
            case .githubLogin:
                return "/api/login"
            case .labels:
                return "/api/labels"
            case .compared:
                return "/"
            }
        }
    }
    
    // MARK: - Properties
    var url: URL? {
        var components = URLComponents()
        components.host = baseUrl
        components.scheme = scheme
        components.path = path.description

        return components.url
    }
    
    var baseUrl: String = "13.124.148.192"
    var scheme: String = "http"
    var path: Path
}

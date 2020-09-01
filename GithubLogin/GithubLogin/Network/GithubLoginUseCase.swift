//
//  GithubLoginUseCase.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

protocol GithubLoginNetWork {
    var session: URLSession { get }
    
    func request(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}


struct GithubLoginUseCase: GithubLoginNetWork {
    
    static var shared: GithubLoginUseCase = .init()
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        session.dataTask(with: request, completionHandler: completion)
            .resume()
    }
}


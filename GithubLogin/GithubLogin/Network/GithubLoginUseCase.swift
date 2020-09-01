//
//  GithubLoginUseCase.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation
import Combine

protocol GithubLoginNetWork {
    var session: URLSession { get }
    
    func request(request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}


struct GithubLoginUseCase: GithubLoginNetWork {
    
    // MARK: - Properties
    static var shared: GithubLoginUseCase = .init()
    var session: URLSession
    
    // MARK: - Lifecycle
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    func request(request: URLRequest) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return session.dataTaskPublisher(for: request)
            .eraseToAnyPublisher()
    }
}


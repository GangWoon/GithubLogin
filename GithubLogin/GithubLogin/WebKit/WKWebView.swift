//
//  WKWebView.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import WebKit
import Combine

extension WKWebView {
    // MARK: - Publisher
    struct TokenPublisher: Publisher {
        
        // MARK: - Type
        typealias Output = String
        typealias Failure = Error
        
        // MARK: - Methods
        func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let subscription = TokenSubscription(subscriber)
            subscriber
                .receive(subscription: subscription)
        }
        
    }
    
    // MARK: Subscription
    class TokenSubscription<S: Subscriber>: Subscription where S.Input == String, S.Failure == Error {
        
        // MARK: - Properties
        private var subscriber: S?
        
        // MARK: - Lifecycle
        init(_ subscriber: S) {
            self.subscriber = subscriber
            getToken()
        }
        
        // MARK: - Methods
        func request(_ demand: Subscribers.Demand) { }
        
        func cancel() {
            subscriber = nil
        }
        
        private func getToken() {
            WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
                guard let token = cookies
                    .filter({ $0.name == "jwt" }).first?.value else { return }
                _ = self.subscriber?.receive(token)
                self.subscriber?.receive(completion: .finished)
            }
        }
    }
}


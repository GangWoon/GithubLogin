//
//  DionViewController.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class DionViewController: UIViewController {
    
    static let identifier: String = "DionViewController"
    var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: Endpoint(path: .labels).url!, method: .GET)
        cancellable = GithubLoginUseCase.shared
            .request(request: request)
            .sink(receiveCompletion: { _ in }) { data, _ in
                print(String(data: data, encoding: .utf8))
        }
    }
}

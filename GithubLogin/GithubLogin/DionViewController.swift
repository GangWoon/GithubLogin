//
//  DionViewController.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class DionViewController: UIViewController {
    static let identifier: String = "DionViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GithubLoginUseCase.shared.request(request: URLRequest(url: Endpoint(path: .labels).url!, method: .GET)) { data, _, _ in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8))
        }
    }
}

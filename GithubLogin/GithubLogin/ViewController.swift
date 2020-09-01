//
//  ViewController.swift
//  GithubLogin
//
//  Created by Cloud on 2020/09/01.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - IBACtions
    @IBAction func requestLogin(_ sender: UIButton) {
        guard let githubLoginViewController = storyboard?.instantiateViewController(identifier: GithubLoginViewController.identifier) as? GithubLoginViewController else { return }
        githubLoginViewController.modalPresentationStyle = .fullScreen
        githubLoginViewController.delegate = self
        present(githubLoginViewController,
                animated: true)
    }
}

extension ViewController: GithubLoginViewControllerDelegate {
    func loginCompleted() {
        guard let dionViewController = storyboard?.instantiateViewController(identifier: DionViewController.identifier) as? DionViewController else { return }
        dionViewController.modalPresentationStyle = .fullScreen
        present(dionViewController,
                animated: true)
    }
}

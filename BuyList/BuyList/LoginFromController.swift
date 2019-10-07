//
//  LoginFromController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 17.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit


class LoginFromController: UIViewController {
    
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func loginButtonTapped() {
        guard let loginUrl = URL(string: "http://www.buy-list.cloud/auth/login/google-oauth2/") else { fatalError() }
        guard let loginWebkitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginWebkitViewController") as? LoginWebkitViewController else { return }
        loginWebkitViewController.setup(url: loginUrl, delegate: self)
        navigationController?.pushViewController(loginWebkitViewController, animated: true)
    }
}

extension LoginFromController: LoginWebkitViewControllerDelegate {
    func didReceive(token: String) {
//        let alert = UIAlertController(title: "Токен получен", message: "Токен:\n\(token)", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
        Session.instance.token = token
        guard let listController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListController") as? ListController else { return }
        navigationController?.pushViewController(listController, animated: true)
        print("🔥\(Session.instance.token)🔥")
    }
}

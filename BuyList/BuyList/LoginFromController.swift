//
//  LoginFromController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 17.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import UIKit
//import GoogleSignIn
import OAuthSwift

class LoginFromController: UIViewController {
    
    private func presentAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
//    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction private func share(_ sender: AnyObject) {
        let oauthswift = OAuth2Swift(
            consumerKey: "",         // [1] Enter google app settings
            consumerSecret: "",        // No secret required
            authorizeUrl: "http://www.buy-list.cloud/auth/login/google-oauth2/",
            accessTokenUrl: "",
            responseType: "code"
        )
        
        oauthswift.allowMissingStateCheck = true
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        
        guard let rwURL = URL(string: "http://www.google.com") else { return }
        oauthswift.authorize(withCallbackURL: rwURL, scope: "", state: "", success: { (credential, response, parameters) in
        }) { (error) in
            self.presentAlert("Error", message: error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        GIDSignIn.sharedInstance()?.presentingViewController = self

        
        // Automatically sign in the user.
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let checkUser = GIDSignIn.sharedInstance()?.restorePreviousSignIn()
//
//        return checkUser
//    }
    
//    Метод для выхода из аккаунта.
//    func didTapSignOut(_ sender: AnyObject) {
//        GIDSignIn.sharedInstance().signOut()
//    }
}

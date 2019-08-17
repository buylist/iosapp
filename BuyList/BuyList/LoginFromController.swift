//
//  LoginFromController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 17.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class LoginFromController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        
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

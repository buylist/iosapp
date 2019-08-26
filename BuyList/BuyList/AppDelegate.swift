//
//  AppDelegate.swift
//  BuyList
//
//  Created by Boris Botov on 13.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit
//import GoogleSignIn
import OAuthSwift
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, open url: URL, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
//        GIDSignIn.sharedInstance().clientID = ""
//
//        GIDSignIn.sharedInstance().delegate = self
////        GIDSignIn.sharedInstance().scopes.append("https://www.buy-list.cloud/auth/login/google-oauth2/")
        return true
    }

    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        OAuthSwift.handle(url: url)
//        return GIDSignIn.sharedInstance().handle(url)
        return true
    }
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//        if let error = error {
//            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//                print("The user has not signed in before or they have since signed out.")
//            } else {
//                print("\(error.localizedDescription)")
//            }
//            return
//        }
////        // Perform any operations on signed in user here.
////        let userId = user.userID                  // For client-side use only!
////        let idToken = user.authentication.idToken // Safe to send to the server
////        let fullName = user.profile.name
////        let givenName = user.profile.givenName
////        let familyName = user.profile.familyName
////        let email = user.profile.email
////        // ...
//
////        Переход после успешной авторизации.
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ListController") as! ListController
//        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
//    }

}


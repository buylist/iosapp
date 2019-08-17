//
//  TokenService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class TokenService {
    
    private let url = "http://35.228.148.217:80/api/token/"
    
    public func loadListTokenPost(username: String, password: String) {
        
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadListGooglePost() {
        
        let url = "http://www.buy-list.cloud/auth/login/google-oauth2/"
        
        Alamofire.request(url, method: .get).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                print(value)
            }
        }
    }
}

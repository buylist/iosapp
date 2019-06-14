//
//  TestGetService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 14.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class TestGetService {
    
    private let url = "http://127.0.0.1:8000/api/v1/items/"
    //    token: 9c65603928b743c64480e88dea77a50fd90f3f41
    
    public func loadListFriends(completionHandler: (([TestGet]?, Error? ) -> Void)? = nil) {
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        Alamofire.request(url, method: .get, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                completionHandler?(nil, error)
            case .success(let value):
                let json = JSON(value)
                
                let testGet = json.arrayValue.map { TestGet(json: $0) }
                completionHandler?(testGet, nil)
                
                print(testGet)
            }
        }
    }
}

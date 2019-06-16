//
//  ItemService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class ItemService {
    
    private let url = "http://35.228.148.217:8000/api/v1/items/"
    
    public func loadListItemGet(completionHandler: (([ItemGet]?, Error? ) -> Void)? = nil) {
        
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
                
                let itemGet = json.arrayValue.map { ItemGet(json: $0) }
                completionHandler?(itemGet, nil)
                
                print(itemGet)
            }
        }
    }
    
    public func loadListItemPost(name: String, category_name: String, item_id: Int) {
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "name": name,
            "category_name": category_name,
            "item_id": item_id
        ]
        
        Alamofire.request(url, method: .post, parameters: params, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadListItemPatch(url: String, name: String) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "name": name
        ]
        
        Alamofire.request(url, method: .patch, parameters: params, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
            (response) in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let value):
                print(value)
            }
        }
    }
    
    public func loadListItemDelete(url: String) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        Alamofire.request(url, method: .delete, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
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

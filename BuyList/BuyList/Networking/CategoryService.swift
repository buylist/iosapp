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

class CategoryService {
    
    private let url = "http://35.228.148.217:8000/api/v1/categories/"
    
    public func loadListCategoriesGet(completionHandler: (([CategoryGet]?, Error? ) -> Void)? = nil) {
        
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
                
                let categoryGet = json.arrayValue.map { CategoryGet(json: $0) }
                completionHandler?(categoryGet, nil)
                
                print(categoryGet)
            }
        }
    }
    
    public func loadListCategoriesPost(name: String, color: String) {
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "name": name,
            "color": color
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
    
    public func loadListCategoriesPatch(url: String, name: String, color: String) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "name": name,
            "color": color
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
    
    public func loadListCategoriesDelete(url: String) {
        
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

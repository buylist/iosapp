//
//  PatternService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 17.07.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift


class PatternService {
    
    private let url = "http://35.228.148.217:80/api/v1/pattern/"
    private let token = "Token c971f845bc2cc6ed50c75220f0e2eb32d315f7b0"
    
        public func loadPatternListGet(completionHandler: (([PatternGet]?, Error? ) -> Void)? = nil) {
    
            let header: HTTPHeaders = [
                "Authorization": token
            ]
    
            Alamofire.request(url, method: .get, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
                (response) in
                switch response.result {
                case .failure(let error):
                    completionHandler?(nil, error)
                case .success(let value):
                    let json = JSON(value)
    
                    let patternGet = json.arrayValue.map { PatternGet(json: $0) }
                    completionHandler?(patternGet, nil)
    
                    print(patternGet)
                }
            }
        }
    
    public func loadPatternListPost(name: String, mobile_id: Int) {
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "name": name,
            "mobile_id": mobile_id
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
    
    public func loadPatternItemListPost(url: String ,item: String, pattern: String, deleted: Bool, quantity: Int, unit: String) {
        let url = url
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "item": item,
            "pattern": pattern,
            "deleted": deleted,
            "quantity": quantity,
            "unit": unit
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
    
    public func loadPatternItemPatch(url: String, deleted: Bool) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "deleted": deleted
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
    
    public func loadPatternItemDelete(url: String) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": token
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

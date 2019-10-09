//
//  ListsService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ListService {
    
    private let url = "http://35.228.148.217:80/api/v1/lists/"
    let token = "Token \(Session.instance.token)"
//    c971f845bc2cc6ed50c75220f0e2eb32d315f7b0
    public func loadListListGet(completionHandler: (([ListGet]?, Error? ) -> Void)? = nil) {
        
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
                
                let listGet = json.arrayValue.map { ListGet(json: $0) }
                completionHandler?(listGet, nil)
                
                print(listGet)
            }
        }
    }
    
    public func loadListListPost(name: String, mobile_id: Int) {
        
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
    
    public func loadListListPatch(url: String, name: String, checklist_id: Int) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "name": name,
            "checklist_id": checklist_id
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
    
    public func loadListListDelete(url: String) {
        
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
    
    public func loadListFullListPost(name: String, mobile_id: Int, itemName: String, itemCategory: String, iteMmob_cat_id: Int, itemMobile_id: Int, unit: String, quanity: Int, deleted: Bool) {
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "name": name,
            "mobile_id": mobile_id,
            "items": [
                    "name": itemName,
                    "category": itemCategory,
                    "mob_cat_id": iteMmob_cat_id,
                    "mobile_id": itemMobile_id,
            ],
                "unit": unit,
                "quanity": quanity,
                "deleted": deleted
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
    
    public func loadListFullListPatch(url: String, name: String, mobile_id: Int, itemName: String, itemCategory: String, iteMmob_cat_id: Int, itemMobile_id: Int, unit: String, quanity: Int, deleted: Bool) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "name": name,
            "mobile_id": mobile_id,
            "items": [
                "name": itemName,
                "category": itemCategory,
                "mob_cat_id": iteMmob_cat_id,
                "mobile_id": itemMobile_id,
            ],
            "unit": unit,
            "quanity": quanity,
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
}

//
//  RecieptService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 17.07.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift


class RecieptService {
    
    private let url = "http://35.228.148.217:8000/api/v1/reciept/"
    
//    public func loadListListGet(completionHandler: (([ListGet]?, Error? ) -> Void)? = nil) {
//
//        let header: HTTPHeaders = [
//            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
//        ]
//
//        Alamofire.request(url, method: .get, headers: header).responseJSON(queue: .global(qos: .userInitiated)) {
//            (response) in
//            switch response.result {
//            case .failure(let error):
//                completionHandler?(nil, error)
//            case .success(let value):
//                let json = JSON(value)
//
//                let listGet = json.arrayValue.map { ListGet(json: $0) }
//                completionHandler?(listGet, nil)
//
//                print(listGet)
//            }
//        }
//    }
    
    public func loadRecieptListPost(name: String, mobile_id: Int, description: String) {
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "name": name,
            "mobile_id": mobile_id,
            "description": description
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
    
    public func loadRecieptItemListPost(item: String, reciept: String, deleted: Bool, quantity: Int, unit: String) {
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
        ]
        
        let params: Parameters = [
            "item": item,
            "reciept": reciept,
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
    
    public func loadRecieptItemPatch(url: String, deleted: Bool) {
        
        let url = url
        
        let header: HTTPHeaders = [
            "Authorization": "Token 9c65603928b743c64480e88dea77a50fd90f3f41"
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

    public func loadRecieptItemDelete(url: String) {

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

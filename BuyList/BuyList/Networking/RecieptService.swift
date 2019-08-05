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
    
    private let url = "http://35.228.148.217:80/api/v1/reciept/"
    private let token = "Token c971f845bc2cc6ed50c75220f0e2eb32d315f7b0"
    
    public func loadRecieptListGet(completionHandler: (([RecieptGet]?, Error? ) -> Void)? = nil) {

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

                let recieptGet = json.arrayValue.map { RecieptGet(json: $0) }
                completionHandler?(recieptGet, nil)

                print(recieptGet)
            }
        }
    }
    
    public func loadRecieptListPost(name: String, mobile_id: Int, description: String) {
        
        let header: HTTPHeaders = [
            "Authorization": token
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
        
        let url = "http://35.228.148.217:80/api/v1/reciept_item/"
        
        let header: HTTPHeaders = [
            "Authorization": token
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

    public func loadRecieptItemDelete(url: String) {

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

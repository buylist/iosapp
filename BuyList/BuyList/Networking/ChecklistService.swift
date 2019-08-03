//
//  checklistsService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RealmSwift

class ChecklistService {
    
    private let url = "http://35.228.148.217:80/api/v1/checklists/"
    private let token = "Token c971f845bc2cc6ed50c75220f0e2eb32d315f7b0"
    
    public func loadListChecklistPost(name: String, checklist: String, deleted: Bool, quantity: Int, unit: String) {
        
        let header: HTTPHeaders = [
            "Authorization": token
        ]
        
        let params: Parameters = [
            "item": name,
            "checklist": checklist,
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
    
    public func loadListChecklistPatch(url: String, deleted: Bool) {
        
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
    
    public func loadListChecklistDelete(url: String) {
        
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

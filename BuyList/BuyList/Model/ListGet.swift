//
//  ListsGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ListGet: Object {

    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var url_List = ""
    @objc dynamic var name_List = ""
    
    var url_Checklists = List<String>()
    var quantity_Checklists = List<String>()
    var unit_Checklists = List<String>()
    var deleted_Checklists = List<Bool>()
    
    var url_Item = List<String>()
    var item_id_Item = List<Int>()
    var name_Item = List<String>()
    var buyer_id_Item = List<Int>()
    var category_id_Item = List<Int>()
    
    var listGetItems = ListGetItems()
    
    convenience init(json: JSON) {
        self.init()
        
        self.url_List = json["url"].stringValue
        self.name_List = json["name"].stringValue
        
        for item in json["items"].arrayValue {
            
            listGetItems.url_Checklists = item["url"].stringValue
            listGetItems.quantity_Checklists = item["quantity"].stringValue
            listGetItems.unit_Checklists = item["unit"].stringValue
            listGetItems.deleted_Checklists = item["deleted"].boolValue
            
            listGetItems.url_Item = item["item"]["url"].stringValue
            listGetItems.item_id_Item = item["item"]["item_id"].intValue
            listGetItems.name_Item = item["item"]["name"].stringValue
            listGetItems.buyer_id_Item = item["item"]["buyer_id"].intValue
            listGetItems.category_id_Item = item["item"]["category_id"].intValue
            
            url_Checklists.append(listGetItems.url_Checklists)
            quantity_Checklists.append(listGetItems.quantity_Checklists)
            unit_Checklists.append(listGetItems.unit_Checklists)
            deleted_Checklists.append(listGetItems.deleted_Checklists)
            
            url_Item.append(listGetItems.url_Item)
            item_id_Item.append(listGetItems.item_id_Item)
            name_Item.append(listGetItems.name_Item)
            buyer_id_Item.append(listGetItems.buyer_id_Item)
            category_id_Item.append(listGetItems.category_id_Item)
        }
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}

//{
//    "url": "http://35.228.148.217:8000/api/v1/lists/1/",
//    "name": "8марта",
//    "items": [
//    {
//    "url": "http://35.228.148.217:8000/api/v1/checklists/5/",
//    "quantity": "8.0000",
//    "unit": "шт",
//    "item": {
//    "url": "http://35.228.148.217:8000/api/v1/items/1/",
//    "item_id": 666,
//    "name": "Бегемот",
//    "buyer_id": 2,
//    "category_id": 2
//    },
//    "deleted": true
//    },

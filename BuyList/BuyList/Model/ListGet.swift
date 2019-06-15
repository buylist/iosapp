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
    
    @objc dynamic var url_Item_s = ""
    @objc dynamic var quantity_Item_s = ""
    @objc dynamic var unit_Item_s = ""
    @objc dynamic var deleted_Item_s = false
        
    @objc dynamic var url_Item = ""
    @objc dynamic var item_id_Item = 0
    @objc dynamic var name_Item = ""
    @objc dynamic var buyer_id_Item = 0
    @objc dynamic var category_id_Item = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.url_List = json["url"].stringValue
        self.name_List = json["name"].stringValue
        
        self.url_Item_s = json["items"].stringValue
        self.quantity_Item_s = json["quantity"].stringValue
        self.unit_Item_s = json["items"][0]["unit"].stringValue
        self.deleted_Item_s = json["items"][0]["deleted"].boolValue
        
        self.url_Item = json["items"][0]["item"]["url"].stringValue
        self.item_id_Item = json["items"][0]["item"]["item_id"].intValue
        self.name_Item = json["items"][0]["item"]["name"].stringValue
        self.buyer_id_Item = json["items"][0]["item"]["buyer_id"].intValue
        self.category_id_Item = json["items"][0]["item"]["category_id"].intValue
        
//        for items in json["items"].arrayValue
//        {
//            if let url_Item_s = items["url"].string,
//            let quantity_Item_s = items["quantity"].string,
//            let unit_Item_s = items["unit"].string,
//            let deleted_Item_s = items["deleted"].bool,
//
//            let url_Item = items["item"]["url"].string,
//            let item_id_Item = items["item"]["item_id"].int,
//            let name_Item = items["item"]["name"].string,
//            let buyer_id_Item = items["item"]["buyer_id"].int,
//            let category_id_Item = items["item"]["category_id"].int {
//
//                self.url_Item_s = url_Item_s
//                self.quantity_Item_s = quantity_Item_s
//                self.unit_Item_s = unit_Item_s
//                self.deleted_Item_s = deleted_Item_s
//
//                self.url_Item = url_Item
//                self.item_id_Item = item_id_Item
//                self.name_Item = name_Item
//                self.buyer_id_Item = buyer_id_Item
//                self.category_id_Item = category_id_Item
//                print(name_Item)
//
//            }
//        }
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

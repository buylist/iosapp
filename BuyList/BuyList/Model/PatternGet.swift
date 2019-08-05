//
//  PatternGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 03.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class PatternGet: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var url_Pattern = ""
    @objc dynamic var name_Pattern = ""
    
    var url_Items = List<String>()
    var quantity_Items = List<Int>()
    var unit_Items = List<String>()
    var deleted_Items = List<Bool>()
    
    var url_Item = List<String>()
    var name_Item = List<String>()
    var category_Item = List<String>()
    var mobile_id_Item = List<Int>()
    
    var patternGetItems = PatternGetItems()
    
    convenience init(json: JSON) {
        self.init()
        
        self.url_Pattern = json["url"].stringValue
        self.name_Pattern = json["name"].stringValue
        
        for item in json["items_pattern"].arrayValue {
            
            patternGetItems.url_Items = item["url"].stringValue
            patternGetItems.quantity_Items = item["quantity"].intValue
            patternGetItems.unit_Items = item["unit"].stringValue
            patternGetItems.deleted_Items = item["deleted"].boolValue
            
            patternGetItems.url_Item = item["item"]["url"].stringValue
            patternGetItems.name_Item = item["item"]["name"].stringValue
            patternGetItems.category_Item = item["item"]["category"].stringValue
            patternGetItems.mobile_id_Item = item["item"]["mobile_id"].intValue
            
            url_Items.append(patternGetItems.url_Items)
            quantity_Items.append(patternGetItems.quantity_Items)
            unit_Items.append(patternGetItems.unit_Items)
            deleted_Items.append(patternGetItems.deleted_Items)
            
            url_Item.append(patternGetItems.url_Item)
            name_Item.append(patternGetItems.name_Item)
            category_Item.append(patternGetItems.category_Item)
            mobile_id_Item.append(patternGetItems.mobile_id_Item)
        }

    }
    
    override static func primaryKey() -> String? {
        return "url_Pattern"
    }
}


//[
//    {
//        "url": "http://35.228.148.217:80/api/v1/pattern/1/",
//        "name": "Пицца",
//        "items_pattern": [
//        {
//        "url": "http://35.228.148.217:80/api/v1/pattern_item/1/",
//        "quantity": "2.0000",
//        "unit": "кг",
//        "item": {
//        "url": "http://35.228.148.217:80/api/v1/items/149/",
//        "name": "Соль",
//        "category": "Category object (26)",
//        "mobile_id": 123
//        },
//        "deleted": false
//        }
//        ]
//    }
//]

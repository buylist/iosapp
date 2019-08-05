//
//  RecieptGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 03.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class RecieptGet: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var url_Reciept = ""
    @objc dynamic var name_Reciept = ""
    @objc dynamic var description_Reciept = ""
    
    var url_Items = List<String>()
    var quantity_Items = List<Int>()
    var unit_Items = List<String>()
    var deleted_Items = List<Bool>()
    
    var url_Item = List<String>()
    var name_Item = List<String>()
    var category_Item = List<String>()
    var mobile_id_Item = List<Int>()
    
    var recieptGetItems = RecieptGetItems()
        
    convenience init(json: JSON) {
        self.init()
        
        self.url_Reciept = json["url"].stringValue
        self.name_Reciept = json["name"].stringValue
        self.description_Reciept = json["description"].stringValue
        
        for item in json["items_reciept"].arrayValue {

            recieptGetItems.url_Items = item["url"].stringValue
            recieptGetItems.quantity_Items = item["quantity"].intValue
            recieptGetItems.unit_Items = item["unit"].stringValue
            recieptGetItems.deleted_Items = item["deleted"].boolValue
            
            recieptGetItems.url_Item = item["item"]["url"].stringValue
            recieptGetItems.name_Item = item["item"]["name"].stringValue
            recieptGetItems.category_Item = item["item"]["category"].stringValue
            recieptGetItems.mobile_id_Item = item["item"]["mobile_id"].intValue
            
            url_Items.append(recieptGetItems.url_Items)
            quantity_Items.append(recieptGetItems.quantity_Items)
            unit_Items.append(recieptGetItems.unit_Items)
            deleted_Items.append(recieptGetItems.deleted_Items)
            
            url_Item.append(recieptGetItems.url_Item)
            name_Item.append(recieptGetItems.name_Item)
            category_Item.append(recieptGetItems.category_Item)
            mobile_id_Item.append(recieptGetItems.mobile_id_Item)
        }
    }
    
    override static func primaryKey() -> String? {
        return "url_Reciept"
    }
}


//[
//    {
//        "url": "http://35.228.148.217:80/api/v1/reciept/1/",
//        "name": "Торт",
//        "description": "Будет очень вкусный",
//        "items_reciept": [
//        {
//        "url": "http://35.228.148.217:80/api/v1/pattern_item/1/",
//        "quantity": "5.0000",
//        "unit": "кг",
//        "item": {
//        "url": "http://35.228.148.217:80/api/v1/items/150/",
//        "name": "Сахар",
//        "category": "Category object (26)",
//        "mobile_id": 123
//        },
//        "deleted": false
//        }
//        ]
//    }
//]

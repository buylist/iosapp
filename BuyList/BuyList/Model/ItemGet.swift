//
//  ItemGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ItemGet: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var url = ""
    @objc dynamic var name = ""
    @objc dynamic var category = ""
    @objc dynamic var mobile_id = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.url = json["url"].stringValue
        self.name = json["name"].stringValue
        self.category = json["category"].stringValue
        self.mobile_id = json["mobile_id"].intValue
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}

//{
//    "url": "http://35.228.148.217:8000/api/v1/items/3/",
//    "item_id": 653,
//    "name": "Cola",
//    "buyer_id": 2,
//    "category_id": 4
//},

//[
//    {
//        "url": "http://35.228.148.217:80/api/v1/items/149/",
//        "name": "Соль",
//        "category": "Category object (26)",
//        "mobile_id": 123
//    }
//]

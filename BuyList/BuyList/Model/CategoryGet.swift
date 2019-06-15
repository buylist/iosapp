//
//  TestGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 14.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class CategoryGet: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var url = ""
    @objc dynamic var name = ""
    @objc dynamic var modified = ""
    @objc dynamic var color = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.url = json["url"].stringValue
        self.name = json["name"].stringValue
        self.modified = json["modified"].stringValue
        self.color = json["color"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}

//[
//    {
//        "url": "http://35.228.148.217:8000/api/v1/items/3/",
//        "item_id": 653,
//        "name": "Cola",
//        "buyer_id": 2,
//        "category_id": 4
//    },

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
    @objc dynamic var mobile_id = 0
    
    convenience init(json: JSON) {
        self.init()
        
        self.url = json["url"].stringValue
        self.name = json["name"].stringValue
        self.modified = json["modified"].stringValue
        self.color = json["color"].stringValue
        self.mobile_id = json["mobile_id"].intValue
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}

//{
//    "url": "http://35.228.148.217:80/api/v1/categories/18/",
//    "name": "Для дома",
//    "modified": "2019-08-05T16:03:30.068371+03:00",
//    "color": "green",
//    "mobile_id": 0
//}

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

class TestGet: Object {
    
    @objc dynamic var uuid = UUID().uuidString
    @objc dynamic var modified = ""
    @objc dynamic var name = ""
    @objc dynamic var url = ""
    
    convenience init(json: JSON) {
        self.init()
        
        self.modified = json["modified"].stringValue
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}

//[{'modified': '2019-05-22T13:40:01Z',
//    'name': 'Apple',
//    'url': 'http://127.0.0.1:8000/api/v1/items/1/'},

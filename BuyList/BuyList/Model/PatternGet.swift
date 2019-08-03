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
    
    var items_pattern = List<String>()
    
    convenience init(json: JSON) {
        self.init()
        
        self.url_Pattern = json["url"].stringValue
        self.name_Pattern = json["name"].stringValue
        
//        for item in json["items"].arrayValue {
//
//            listGetItems.url_Checklists = item["url"].stringValue
//        }
    }
    
    override static func primaryKey() -> String? {
        return "url_Pattern"
    }
}


//[
//    {
//        "url": "http://35.228.148.217:80/api/v1/pattern/1/",
//        "name": "Пицца",
//        "items_pattern": []
//    }
//]

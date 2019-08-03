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
    
    var items_reciept = List<String>()
    
    convenience init(json: JSON) {
        self.init()
        
        self.url_Reciept = json["url"].stringValue
        self.name_Reciept = json["name"].stringValue
        self.description_Reciept = json["description"].stringValue
        
//        for item in json["items"].arrayValue {
//
//            listGetItems.url_Checklists = item["url"].stringValue
//        }
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
//        "items_reciept": []
//    }
//]

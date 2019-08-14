//
//  ListGetGetGet.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 25.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ListGetItems: Object {
    
    @objc dynamic  var url_Checklists = ""
    @objc dynamic  var quantity_Checklists = ""
    @objc dynamic  var unit_Checklists = ""
    @objc dynamic  var deleted_Checklists = false
    
    @objc dynamic  var url_Item = ""
    @objc dynamic  var name_Item = ""
    @objc dynamic  var category_Item = ""
    @objc dynamic  var mobile_id_Item = 0
}


//[
//    {
//        "url": "http://35.228.148.217:80/api/v1/lists/4/",
//        "name": "aqaq",
//        "mobile_id": 129,
//        "items": [
//        {
//        "url": "http://35.228.148.217:80/api/v1/checklists/19/",
//        "quantity": "8.0000",
//        "unit": "шт",
//        "deleted": false,
//        "item": {
//        "url": "http://35.228.148.217:80/api/v1/items/153/",
//        "name": "Сок",
//        "category": "Category object (18)",
//        "mobile_id": 123
//        }
//        }
//        ]
//    }
//]

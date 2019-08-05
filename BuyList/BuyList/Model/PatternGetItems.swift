//
//  PatternGetItems.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 05.08.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class PatternGetItems: Object {
    
    @objc dynamic  var url_Items = ""
    @objc dynamic  var quantity_Items = 0
    @objc dynamic  var unit_Items = ""
    @objc dynamic  var deleted_Items = false
    
    @objc dynamic  var url_Item = ""
    @objc dynamic  var name_Item = ""
    @objc dynamic  var category_Item = ""
    @objc dynamic  var mobile_id_Item = 0
}

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
    @objc dynamic  var item_id_Item = 0
    @objc dynamic  var name_Item = ""
    @objc dynamic  var buyer_id_Item = 0
    @objc dynamic  var category_id_Item = 0
}

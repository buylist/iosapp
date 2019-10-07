//
//  Session.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 14.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class Session {
    private init() { }
    
    public static let instance = Session()
    
    var token: String = ""
}

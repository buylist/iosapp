//
//  DateRecipe.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 08.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

public struct Item {
    var name: String
    var count: String
    var okView: Bool
    
    public init(name: String, count: String, okView: Bool) {
        self.name = name
        self.count = count
        self.okView = okView
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    var okView: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = false, okView: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
        self.okView = okView
    }
}

public var sectionsDataRecipe: [Section] = [
    Section(name: "Ингредиенты", items: [
        Item(name: "Бананы", count: "400г", okView: false),
        Item(name: "Ананасы", count: "500г", okView: false),
        Item(name: "Яблоки", count: "250г", okView: false)
        ]),
    Section(name: "Инструкция", items: [
        Item(name: "Купить.", count: "", okView: false),
        Item(name: "Помыть.", count: "", okView: false),
        Item(name: "Скушать.", count: "", okView: false)
        ]),
]

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
    
    public init(name: String, count: String) {
        self.name = name
        self.count = count
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsDataRecipe: [Section] = [
    Section(name: "Ингредиенты", items: [
        Item(name: "Ашан", count: "200"),
        Item(name: "Косметика", count: "150")
        ]),
    Section(name: "Инструкция", items: [
        Item(name: "Вечеринка", count: "200"),
        Item(name: "Бытовая", count: "200")
        ]),
]

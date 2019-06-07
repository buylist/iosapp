//
//  ExampleData.swift
//  BuyList
//
//  Created by Boris Botov on 07/06/2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

public struct Item {
    var name: String
    
    public init(name: String) {
        self.name = name
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

public var sectionsData: [Section] = [
    Section(name: "Коллекция списков", items: [
        Item(name: "Ашан"),
        Item(name: "Косметика")
        ]),
    Section(name: "Шаблоны", items: [
        Item(name: "Вечеринка"),
        Item(name: "Бытовая")
        ]),
    Section(name: "Рецепты", items: [
        Item(name: "Наполеон"),
        Item(name: "Драники")
        ])
]

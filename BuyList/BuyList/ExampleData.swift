//
//  ExampleData.swift
//  BuyList
//
//  Created by Boris Botov on 07/06/2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

public struct Item1 {
    var name: String
    
    public init(name: String) {
        self.name = name
    }
}

public struct Section1 {
    var name: String
    var items: [Item1]
    var collapsed: Bool
    
    public init(name: String, items: [Item1], collapsed: Bool = true) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public struct Section2 {
    var name: String
    var collapsed: Bool
    
    public init(name:String, collapsed: Bool = true) {
        self.name = name
        self.collapsed = collapsed
    }
}

//public var sectionsData: [Section1] = [
//    Section1(name: "Коллекция списков", items: [
//        Item1(name: "Ашан"),
//        Item1(name: "Косметика")
//        ]),
//    Section1(name: "Шаблоны", items: [
//        Item1(name: "Вечеринка"),
//        Item1(name: "Бытовая")
//        ]),
//    Section1(name: "Рецепты", items: [
//        Item1(name: "Наполеон"),
//        Item1(name: "Драники")
//        ])
//]

public var sectionData1: [Section2] = [
    Section2(name: "Коллекция списков")
]

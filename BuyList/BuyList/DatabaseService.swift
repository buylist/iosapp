//
//  DatabaseService.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 26.06.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import RealmSwift

class DatabaseService {
    
    @discardableResult
    static func save<T: Object>(_ items: [T], config: Realm.Configuration =
        Realm.Configuration(deleteRealmIfMigrationNeeded: true), update:Bool = true) throws -> Realm {
        print(config.fileURL ?? "")
        let realm = try Realm(configuration: config)
        
        try realm.write {
            realm.add(items, update: true)
        }
        
        return realm
    }
    
    static func get<T: Object>(_ type: T.Type, config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)) -> Results<T>? {
        let realm = try? Realm(configuration: config)
        
        return realm?.objects(type)
    }
    
    @discardableResult
    static func delete<T: Object>(_ items: [T], config: Realm.Configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)) throws -> Realm {
        let realm = try Realm(configuration: config)
        
        try realm.write {
            realm.delete(items)
        }
        return realm
    }
}


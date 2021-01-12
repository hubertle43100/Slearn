//
//  Item.swift
//  Todoey
//
//  Created by Hubert Le on 12/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

//class Item: Object {
//    @objc dynamic var title: String = ""
//    @objc dynamic var done : Bool = false
//    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
//}

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

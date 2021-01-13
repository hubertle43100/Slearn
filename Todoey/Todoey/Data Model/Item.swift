//
//  Item.swift
//  Todoey
//
//  Created by Hubert Le on 12/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object { //subclass of the Realm Object
    //these are like labels for the items that are stored
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    //inverse relationship which links the item to a parentCategory
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

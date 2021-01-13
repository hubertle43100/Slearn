//
//  Category.swift
//  Todoey
//
//  Created by Hubert Le on 12/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object { //subclass of the Realm Object
    //dynamic fits into runtime/buildtime
    @objc dynamic var name: String = ""
    let items = List<Item>() //category has an item which is a list
}

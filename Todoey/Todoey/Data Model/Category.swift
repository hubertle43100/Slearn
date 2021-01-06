//
//  Category.swift
//  Todoey
//
//  Created by Hubert Le on 12/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    //let array = [1,2,3]
    //let array : [Int] = [1,2,3]
    //let array = Array<Item> = [1,2,3]
    //let array = Array<Item>()
}

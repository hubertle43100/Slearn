//
//  item.swift
//  Todoey
//
//  Created by Hubert Le on 12/9/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

class Item: Codable { //can encode itself into a plist
    var title: String = ""
    var done: Bool = false
}

//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Hubert Le on 11/17/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

//K: short for Constants
//struct K {
//    //static: make vvariable type
//    static let registerSegue = "RegisterToChat"
//    static let loginSegue = "LoginToChat"
//}


struct K {
    static let appName = "⚡️FlashChat" 
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Hubert Le on 10/13/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String){
        text = q
        answer = a
    }
}

//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import  CLTypingLabel

class WelcomeViewController: UIViewController {
    //change UILabel --> CLTypingLabel
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
        
        //simple for-loop
//        let fruitBasket = ["Apple", "Pear", "Orange"]
//        for fruit in fruitBasket {
//            print(fruit)
//        }
        
//        titleLabel.text = ""
//        var charIndex = 0.0 //turn charIndex into a double from 0 --> 0.0
//        let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            print("-")
//            print(0.1 * charIndex)
//            print(letter)
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            charIndex += 1
//           // print(letter) //sperate each character
//            //titleLabel.text?.append(letter)
//        }
    }
    

}

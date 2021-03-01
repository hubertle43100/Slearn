//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOulet goes from code to UI
    //right click and drag image here
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 1
    var rightDiceNumber = 5
        
        //Who.What = Value (structure for code)
        //Can go to properties for reference
    
    //IBAction goes from UI to code
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        //var is only for changing the variable
        //let is for a set of non-changing variable
        let diceArray = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
        //can get image by typing image Literal
        
        //print("Button got tapped")
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray[Int.random(in:0...5)]
        
        //left increase ^ right decrease v
        leftDiceNumber += 1
        rightDiceNumber -= 1
    }
    
}


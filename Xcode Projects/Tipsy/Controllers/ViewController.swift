//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2 //doesn't matter if you put one
    var billTotal = 0.0
    var finalResult = "0.0"
    var tip = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true //highlights which ever one is true
        
        let buttonTitle = sender.currentTitle! //take current number title
        let buttonPercent = String(buttonTitle.dropLast()) //drop the % sign so 20% will be just 20
        let buttonNumber = Double(buttonPercent)!
        tip = buttonNumber / 100 // (20/100) = .20
        
       // let buttonTitle = sender.currentTitle!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value) //sender.value is the number of times clicked? (change between + and -)?
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //print(numberOfPeople) prints out "12"
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            //print(billTotal) prints out the number inputed
            let result = (billTotal * (1 + tip)) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
            //print(result) no format kinda wack
            print(finalResult)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //auto generated with prepare
        if(segue.identifier == "goToResults"){// only get triggered when "calculate" is pressed
            
            //make sure it is destination instead of description
            let destinationVC = segue.destination as! ResultsViewController
            
            //initialize these numbers in Results view controller (passing var through)
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
    

}


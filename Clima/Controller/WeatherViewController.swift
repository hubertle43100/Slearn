//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self //keeps track of what the user is doing (VC user stop typing, VC user try to tap elsewhere)
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)//keyboard goes away
        
        print(searchTextField.text!) //print whatever is written down when search button is pressed
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //triggered when "return" is pressed
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    //func with UITextField is only triggered when the search bar thingy is used
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text != ""){
            return true
        } else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Use searchTextField.text to get the weather for that city
        
        //VC user stop editing
        searchTextField.text = ""
    }
}


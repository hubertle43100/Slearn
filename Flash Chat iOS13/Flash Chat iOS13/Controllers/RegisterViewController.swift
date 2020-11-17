//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        //optional chaining --> only runs if email and password are both not nil
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
                if let e = error {
                    print(e.localizedDescription) //error in any language (crazy!!!)
                } else {
                    //Navigate to ChatViewController
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
}

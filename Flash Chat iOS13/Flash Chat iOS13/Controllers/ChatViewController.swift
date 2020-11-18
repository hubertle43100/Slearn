//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "hubertle43100@gmail.com", body: "Hey!"),
        Message(sender: "1@e.com", body: "Hello!"),
        Message(sender: "1@e2.com", body: "What's up?"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        //deleting back button...
        navigationItem.hidesBackButton = true
        
        //adding title...
        title = K.appName

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        //let firebaseAuth = Auth.auth()
        do {
          try Auth.auth().signOut()
            
            //navigate to home screen here (use pop to route)
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count //number of message in array
    }
    
    //this method is going to run 3 times: 3 items in message array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "this is a cell"
        return cell
    }
    
    
}

//
//  SwipeViewController.swift
//  Todoey
//
//  Created by Hubert Le on 1/13/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

/*  SUPERCLASS MUST KNOW NOTHING FROM THE SUBCLASS */

import UIKit
import SwipeCellKit

class SwipeViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                                                            //Main.storyboard - change the identifiers to "Cell" so both subclasses can use it
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        //this gets tapped in the newly created cell & gets it's indexPath
        //let cell = super.tableView(tableView, cellForRowAt: indexPath)
          
          //cell will look at location of cell if there is a category --> then fills up the cell (if NIL then print "")
         // cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
          
          cell.delegate = self //self == current ViewController
          
          return cell //this return cell gets passed to the cell in 'CategoryViewController'
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        //make sure the swipe is coming from the right
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            //print("Item deleted")
            print("Delete Cell")
            
//            if let categoryForDeletion = self.categories?[indexPath.row] { //dealing with an optional
//                do {
//                    try self.realm.write {
//                        self.realm.delete(categoryForDeletion)
//                    }
//                } catch {
//                    print("Error deleting category, \(error)")
//                }
//
//               // tableView.reloadData()
//            }
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        //options.transitionStyle = .border
        return options
    }
}

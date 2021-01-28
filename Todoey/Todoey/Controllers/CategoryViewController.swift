//
//  CategoryViewControl.swift
//  Todoey
//
//  Created by Hubert Le on 12/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
//import SwipeCellKit

class CategoryViewController: SwipeViewController {
             //try! == code smell (not an issue)
    let realm = try! Realm() //initlizing realm ...
    
    //collection of Results(of category "Object")
    var categories: Results<Category>? //optional? --> to be safe

    override func viewDidLoad() { //first thing that happens when loading up the app
        super.viewDidLoad()
        loadCategories()
        
        //color covers the entire cell
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {
            fatalError("navigation controller does not exist.")
        }
        
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")
    }
    
    
    
    
    
    //MARK: - TableView Datasource Methods
    
    //.reloadData() --> calls function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //return #s of Rows
        return categories?.count ?? 1 //NIL coalescing Operator (if nil then return 1)
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //initlize dequeueResusableCekk downcasting it as a SqipeTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categories?[indexPath.row] {
            cell.textLabel?.text = category.name
            
            guard let categoryColour = UIColor(hexString: category.colour) else {
                fatalError()
            }
            
            cell.backgroundColor = categoryColour
            cell.textLabel?.textColor = ContrastColorOf(categoryColour, returnFlat: true)
        }
        
        
        //cell will look at location of cell if there is a category --> then fills up the cell (if NIL then print "")
        //cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
        
      //  cell.delegate = self //self == current ViewController
        
        //cell.backgroundColor = UIColor.randomFlat()
        //cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].colour ?? "1D9BF6")//
        
        return cell
        
    }
    
    
    
    
    
    
    //MARK: - TableView Delegate Methods
    //when a cell has been clicked --> call this function
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self) // do a seqgue from Category to ToDoList
    }
    
    //before going to the next screen (segue) we would execute this
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController //creating new instance...
        
        if let indexPath = tableView.indexPathForSelectedRow { //know what row is selected (put in if statement just in case)
            destinationVC.selectedCategory = categories?[indexPath.row] //send the category & its row #
        }
    }
    
    
    
    
    
    
    //MARK: - Delete Data From Swipe
    //override and call superclass
    override func updateModel(at indexPath: IndexPath) { //override ignore functionality of the superclass
        
        super.updateModel(at: indexPath) //accessing superclass? (calling superclass)
        
        //delegate method --> delete category from list
        if let categoryForDeletion = self.categories?[indexPath.row] { //dealing with an optional
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    
    
    
    
    
    //MARK: - Data Manipulation Methods
            //pass in the new category that just add using <-- 'addButtonPressed'
    func save(category: Category) {
        do {
            try realm.write { //commiting to realm...
                realm.add(category) //if there anything to change
            }
        } catch {
            print("Error while saving \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
        //pulls out objects from realm that is type 'Category'
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
    
    
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) { //calls function when '+' button is pressed
        var textField = UITextField()
        
        //^ pops up an alert ^
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in //if 'add' button is pressed in alert then -->
            let newCategory = Category() //Category is straight up object
            newCategory.name = textField.text! //text in UIAlert
            
            newCategory.colour = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
        }
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new Category"
        }
        
        present(alert, animated: true, completion: nil)
    }
}





//MARK: - Swipe Cell Delegate Methods

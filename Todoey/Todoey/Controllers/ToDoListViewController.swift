//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//


//encoding --> takes music and turns it into a vinyl disc
//decoding --> turning vinyl disc into music

import UIKit
import RealmSwift

class ToDoListViewController: UITableViewController {
    //can rename by clicking with "command"
    var todoItems: Results<Item>? //collection of results that are item objects
    
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet{ //triggers when there is a value for Category
            loadItems()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) //path where data is stored
    }
    
    
    
    
    
    //MARK: - Tableview Datasource Methods
    //.reloadData() --> call this method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1 //if there is no item in list then return 1
    }
    
    //how we should display all of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item = todoItems?[indexPath.row] { //this makes it shorter for everything that you do
            
                   cell.textLabel?.text = item.title //textLabel will be the same name current title for that item
                   
                   //turnary operator -->
                   //value = condition ? valueIfTrue : valueIfFalse
            
                   cell.accessoryType = item.done ? .checkmark : .none //checkmark given if item.done is true
        } else { //if item is nil
            cell.textLabel?.text = "no items added"
        }
        return cell
    }
    
    
    
    
    
    //MARK: - TableView Delegates Methods
    //when a cell has been selected --> call function
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row] { //grab the item in the current row
            do {
                try realm.write { //updating value...
                    item.done = !item.done //toggle (opposite) of item.done
                }
            } catch {
                print("Error saving done status, \(error)")
            }
        }
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //has scope for the entire func
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
                   
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            //commiting CRUD to our context --> persistent container
            if let currentCategory = self.selectedCategory { //check if selectedCategory is nil <-- optional?
                do {
                    //try to update the realm data
                    try self.realm.write { //saving...
                        let newItem = Item() //creating item...
                        newItem.title = textField.text! //give item a name
                        newItem.dateCreated = Date() //be the current date/time
                        currentCategory.items.append(newItem) //add new item to the list
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            
            self.tableView.reloadData() //call data source methods and update them
        }
        
        //only triggers when someone adds something to their list
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            //print(alertTextField.text)
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    //MARK: - Model Manipulation Methods
    //has external and internal parameter
    func loadItems() {
        //loads all items and pulls it out in acending order
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
}





//MARK: - Search bar methods
extension ToDoListViewController: UISearchBarDelegate { //help separate functionality
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { //only triggers when "enter"/"search" button is pressed

        //update our collection of items
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true) //todoItem is the word typed into the searchBar (ordered by date)
        
        tableView.reloadData()
    }

    //this triggers when we dissmiss the search bar (pressing 'x' when clearing search bar)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 { //when there is nothing in the searchBar
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}



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
import CoreData

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    var selectedCategory: Category? {
        didSet{ //triggers when there is a value for Category
            loadItems()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) //path where data is stored
    }
    
    
    
    //MARK: - TableviewDatasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //how we should display all of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
        //print("cellForRowAtIndexPath Called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row] //this makes it shorter for everything that you do
        
        //cell.textLabel?.text = itemArray[indexPath.row].title
        cell.textLabel?.text = item.title
        
        //turnary operator -->
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    
    //MARK: - TableView Delegates Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])  -->  # row that was selected --> name selected
        
        // itemArray[indexPath.row].setValue("Completed", forKey: "title")
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done //this line replaces the if statement below
        saveItem()
        
        //tableView.reloadData() //forces the tableView to call data sources --> reload data
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //has scope for the entire func
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
                   
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false //it is not optional is needs a value
            newItem.parentCategory = self.selectedCategory
            self.itemArray.append(newItem)
            
            self.saveItem()
            
            //only should be using defaults for small amount of data
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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
    func saveItem() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    //has external and internal parameter
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        
        //must specify the data type
        //let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from contex \(error)")
        }
    }
}



//MARK: - Search bar methods
extension ToDoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItems(with: request)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}


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
    var todoItems: Results<Item>? //not an array but a result container
   //var todoItems = [Item]()
    let realm = try! Realm()
    
    var selectedCategory: Category? {
        didSet{ //triggers when there is a value for Category
           // loadItems()
        }
    }
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    //^ singleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) //path where data is stored
    }
    
    
    
    //MARK: - TableviewDatasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1 //if nil then return 1
    }
    
    //how we should display all of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item = todoItems?[indexPath.row] { //this makes it shorter for everything that you do
            //cell.textLabel?.text = itemArray[indexPath.row].title
                   cell.textLabel?.text = item.title
                   
                   //turnary operator -->
                   //value = condition ? valueIfTrue : valueIfFalse
                   cell.accessoryType = item.done ? .checkmark : .none
        } else { //if item is nil
            cell.textLabel?.text = "no items added"
        }
        
//        //cell.textLabel?.text = itemArray[indexPath.row].title
//        cell.textLabel?.text = item.title
//
//        //turnary operator -->
//        //value = condition ? valueIfTrue : valueIfFalse
//        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    
    //MARK: - TableView Delegates Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])  -->  # row that was selected --> name selected
        
        // itemArray[indexPath.row].setValue("Completed", forKey: "title")
//        todoItems?[indexPath.row].done = !todoItems[indexPath.row].done //this line replaces the if statement below
//        saveItems()
        
        //tableView.reloadData() //forces the tableView to call data sources --> reload data
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    //realm.delete(item)
                    item.done = !item.done
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
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write { //saving...
                        let newItem = Item() //create item
                        newItem.title = textField.text! //give item a name
                        currentCategory.items.append(newItem) //add it to the list
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            
            self.tableView.reloadData() //call data source methods and update them
            
//            let newItem = Item()
//            newItem.title = textField.text!
//           // newItem.done = false //it is not optional is needs a value
//            newItem.parentCategory = self.selectedCategory
//            self.itemArray.append(newItem)
//
//            self.saveItems()
            
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
//    func saveItems() {
//        do {
//            try context.save()
//        } catch {
//            print("Error saving context \(error)")
//        }
//
//        self.tableView.reloadData()
//    }
    
    //has external and internal parameter
    func loadItems() { //with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {//can load items without parameters b/c it has default values
        
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

//       // must specify the data type
//        let request : NSFetchRequest<Item> = Item.fetchRequest()
//
//        //overrides the other (request.predicate) that we have below --> goes to new Item list
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!) //parent name needs to match up with the selected cell
//
//        //used optional binding to create this (unwrapping a nil value)
//        if let additionPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from contex \(error)")
//        }
        
        tableView.reloadData()
    }
}



//MARK: - Search bar methods
//extension ToDoListViewController: UISearchBarDelegate { //help separate functionality
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { //only triggers when "enter" button is pressed
//
//        //initlize a request
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//        //how to add filter\query our data
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//                                        //^ title must contain what is currently in the search bar
//
//        //sorting the Data in Alphabetical order
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//        //run loadItems with the request
//        loadItems(with: request, predicate: predicate)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
//


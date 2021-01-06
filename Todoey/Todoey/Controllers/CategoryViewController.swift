//
//  CategoryViewControl.swift
//  Todoey
//
//  Created by Hubert Le on 12/23/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm() //initlizing realm ...
    
//    var categories = [Category]()
    var categories: Results<Category>?
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1 //NIL coalescing Operator (if nil then return 1)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Category added yet"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self) // do a seqgue from Category to ToDoList
    }
    
    //before going to the next screen (segue) we would execute this
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow { //know what row is selected (put in if statement just in case)
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(category: Category) {
        do{
           //try context.save()
            try realm.write {
                realm.add(category)
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
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category() //Category is straight up object
            newCategory.name = textField.text! //text in UIAlert
            
//            self.categories.append(newCategory)
            
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

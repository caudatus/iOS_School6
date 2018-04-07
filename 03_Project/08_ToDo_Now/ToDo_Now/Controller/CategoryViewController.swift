//
//  CategoryViewController.swift
//  ToDo_Now
//
//  Created by Seo JaeHyeong on 06/04/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//
import CoreData
import UIKit

class CategoryViewController: UITableViewController {

   
   var categories = [Category]()
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
      super.viewDidLoad()
      loadCategory()
    }

   
   @IBAction func addButtonPressed(_ sender: Any) {
      var textField = UITextField()
      
      let alertVC = UIAlertController(title: "카테고리 추가", message: nil, preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "확인", style: .default) { [unowned self]
         action in
         if let text = textField.text {
            let newCategory = Category(context: self.context)
            newCategory.name = text
            
            self.categories.append(newCategory)
         }
         self.saveCategory()
      }
      
      alertVC.addTextField { alertTf in
         textField.placeholder = "카테고리 이름을 입력하세요"
         textField = alertTf
      }
      
      alertVC.addAction(alertAction)
      present(alertVC, animated: true, completion: nil)
   }
   
   
   //MARK: - Data Manipulation Methods

   func saveCategory() {
      do {
         try context.save()
      } catch {
         print("Error Category saving context  : ", error)
      }
      tableView.reloadData()
   }
   
   
   func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
      do {
         categories = try context.fetch(request)
      } catch {
         print("Error Category fetching data : ", error)
      }
      
      tableView.reloadData()
   }
   
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
   
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
      cell.textLabel?.text = categories[indexPath.row].name
      
      return cell
   }
   
   
   // MARK: - Table view delegate Methods
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      performSegue(withIdentifier: "goToItems", sender: self)
   }
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let destinationVC = segue.destination as! ToDoListViewController
      if let indexPath = tableView.indexPathForSelectedRow {
         destinationVC.selectedCategory = categories[indexPath.row]
      }
   }


}
























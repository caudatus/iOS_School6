//
//  ToDoListViewController.swift
//  ToDo_Now
//
//  Created by Seo JaeHyeong on 29/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

   var itemArray = [Item]()
   //let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoItems.plist")
   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   var selectedCategory: Category? {
      didSet {
         loadItem()
      }
   }
   
   @IBOutlet weak var searchBar: UISearchBar!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      searchBar.delegate = self
    }

   
   @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
      var textField = UITextField()
      
      let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
      let action = UIAlertAction(title: "확인", style: .default) { (action) in
         if let todoText = textField.text {
            let item = Item(context: self.context)
            item.title = todoText
            item.done = false
            item.parentCategory = self.selectedCategory
            
            self.itemArray.append(item)
         }
         self.saveItems()
      }
      
      alert.addTextField { (alertTf) in
         alertTf.placeholder = "새로운 할 일을 추가하세요"
         //alertTf.borderStyle = .roundedRect
         textField = alertTf
      }
      
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
   }
   
   
   //MARK: - save, load the item to plist
//   func saveItems() {
//      let encoder = PropertyListEncoder()
//
//      do {
//         let data = try encoder.encode(itemArray)
//         try data.write(to: filePath!)
//      } catch {
//         print("Error encoding itemArray : ", error)
//      }
//      tableView.reloadData()
//   }
   func saveItems() {
      do {
         try context.save()
      } catch {
         print("Error saving context  : ", error)
      }
      tableView.reloadData()
   }
   
   
//   func loadItem() {
//      if let data = try? Data(contentsOf: filePath!) {
//         let decoder = PropertyListDecoder()
//         do {
//            itemArray = try decoder.decode([Item].self, from: data)
//         } catch {
//            print("Error decoding itemArray : ", error)
//         }
//      }
//   }
   
   func loadItem(with request: NSFetchRequest<Item> = Item.fetchRequest(),
                 predicate: NSPredicate? = nil) {
      
      let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
      
      if let additionalPredicate = predicate {
         request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, additionalPredicate])
      } else {
         request.predicate = categoryPredicate
      }
      
      do {
         itemArray = try context.fetch(request)
      } catch {
         print("Error fetching data : ", error)
      }
      
      tableView.reloadData()
   }

   
   // MARK: - Table view data source
   
   override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return itemArray.count
   }
   
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
      let item = itemArray[indexPath.row]
      cell.textLabel?.text = item.title
      
      cell.accessoryType = item.done ? .checkmark : .none
      
      return cell
   }
   
   
   //MARK: - Table view delegate Method
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      itemArray[indexPath.row].done = !itemArray[indexPath.row].done
      saveItems()
      tableView.deselectRow(at: indexPath, animated: true)
   }
   /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
   
   /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
    // Delete the row from the data source
    tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
   
   /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    
    }
    */
   
   /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
   
   
}



//MARK: - Search Bar Methods
extension ToDoListViewController: UISearchBarDelegate {
   
   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      let request: NSFetchRequest<Item> = Item.fetchRequest()
      
      request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
      request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
      
      loadItem(with: request)
//      do {
//         itemArray = try context.fetch(request)
//      } catch {
//         print("Error search fetching data : ", error)
//      }
      
   }
   
   
   func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      if searchBar.text?.count == 0 {
         loadItem()
         DispatchQueue.main.async {
            searchBar.resignFirstResponder()
         }
      }
   }
}





























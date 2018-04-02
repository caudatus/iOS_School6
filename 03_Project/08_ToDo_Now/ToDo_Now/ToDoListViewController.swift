//
//  ToDoListViewController.swift
//  ToDo_Now
//
//  Created by Seo JaeHyeong on 29/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

   var defaults = UserDefaults.standard
   var itemArray = ["Buy Beer", "Study Swift", "Have a Good Day"]
   
    override func viewDidLoad() {
      super.viewDidLoad()
      if let item = defaults.array(forKey: "TODO_LIST_RK") as? [String] {
         itemArray = item
      }
    }

   
   @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
      var textField = UITextField()
      
      let alert = UIAlertController(title: "To Do Now", message: "", preferredStyle: .alert)
      let action = UIAlertAction(title: "할 일 추가", style: .default) { (action) in
         if let todoText = textField.text {
            self.itemArray.append(todoText)
            self.defaults.set(self.itemArray, forKey: "TODO_LIST_RK")
         }
         self.tableView.reloadData()
      }
      
      alert.addTextField { (alertTf) in
         alertTf.placeholder = "새로운 할 일을 추가하세요"
         //alertTf.borderStyle = .roundedRect
         textField = alertTf
      }
      
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
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
      cell.textLabel?.text = itemArray[indexPath.row]
      
      return cell
   }
   
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none
      } else {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      }
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
   
   /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
   
}































//
//  ChatViewController.swift
//  Open_Chat_Now
//
//  Created by Seo JaeHyeong on 20/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController {

   @IBOutlet weak var messageTableView: UITableView!
   @IBOutlet weak var messageTf: UITextField!
   @IBOutlet weak var heightConstraint: NSLayoutConstraint!
   @IBOutlet weak var msgSendBtn: UIButton!
   
   var messageArray: [Message] = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      messageTableView.delegate = self
      messageTableView.dataSource = self
      
      messageTableView.register(UINib(nibName: "FeaturedCell", bundle: nil), forCellReuseIdentifier: "featuredCell")
      messageTableView.register(UINib(nibName: "FeaturedHostCell", bundle: nil), forCellReuseIdentifier: "featuredHostCell")
      configureTableView()
      
      messageTf.delegate = self
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
      messageTableView.addGestureRecognizer(tapGesture)

      updateMessages()

      messageTableView.separatorStyle = .none
    }
   
   
   @IBAction func msgSendPressed(_ sender: UIButton) {
      messageTf.endEditing(true)
      
      messageTf.isEnabled = false
      msgSendBtn.isEnabled = false
      
      let DB = Database.database().reference().child("Messages")
      let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                               "MessageText": messageTf.text]
      
      DB.childByAutoId().setValue(messageDictionary) {
         (error, reference) in
         if error != nil {
            print(error!)
         } else {
            print("Text saved Successfully")
            
            self.messageTf.isEnabled = true
            self.msgSendBtn.isEnabled = true
            self.messageTf.text = ""
         }
      }
   }
   
   
   func updateMessages() {
      let DB = Database.database().reference().child("Messages")
      DB.observe(.childAdded) { (snapShot) in
         let snapValue = snapShot.value as! Dictionary<String,String>
         let text = snapValue["MessageText"]
         let sender = snapValue["Sender"]
         
         let message = Message()
         message.ID = sender!
         message.MESSAGE = text!
   
         self.messageArray.append(message)
         self.messageTableView.reloadData()

      }
   }
   
}



extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return messageArray.count
   }


   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      
      if messageArray[indexPath.row].ID == Auth.auth().currentUser?.email {
      // host인 경우(본인)
         let cell = messageTableView.dequeueReusableCell(withIdentifier: "featuredHostCell", for: indexPath) as! FeaturedHostCell
         
         cell.messageLb.text = messageArray[indexPath.row].MESSAGE
         cell.idLb.text = messageArray[indexPath.row].ID
         cell.profileIng.image = UIImage(named: "cat_red")
         
         cell.profileIng.backgroundColor = UIColor.flatWhite()
         cell.mainBackground.backgroundColor = UIColor.flatWatermelon()
         
         return cell
      } else {
      // guest 인 경우(본인 이외)
         let cell = messageTableView.dequeueReusableCell(withIdentifier: "featuredCell", for: indexPath) as! FeaturedCell
         
         cell.messageLb.text = messageArray[indexPath.row].MESSAGE
         cell.idLb.text = messageArray[indexPath.row].ID
         cell.profileImg.image = UIImage(named: "cat_black")
         
         cell.profileImg.backgroundColor = UIColor.flatWhite()
         cell.mainBackground.backgroundColor = UIColor.flatBrown()
         
         return cell
      }

   }


//   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//      return 80.0
//   }


   func configureTableView() {
      messageTableView.rowHeight = UITableViewAutomaticDimension
      messageTableView.estimatedRowHeight = 120.0
   }

   
   @objc func tableViewTapped() {
      messageTf.endEditing(true)
   }

}



extension ChatViewController: UITextFieldDelegate {
   func textFieldDidBeginEditing(_ textField: UITextField) {
      print("didbeginediting")
      UIView.animate(withDuration: 0.5) {
         self.heightConstraint.constant = 258
         self.view.layoutIfNeeded()
      }
   }

   func textFieldDidEndEditing(_ textField: UITextField) {
      UIView.animate(withDuration: 0.5) {
         self.heightConstraint.constant = 0
         self.view.layoutIfNeeded()
      }
   }
}































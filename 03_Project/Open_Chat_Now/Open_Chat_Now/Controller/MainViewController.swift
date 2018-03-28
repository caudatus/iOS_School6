//
//  MainViewController.swift
//  Open_Chat_Now
//
//  Created by Seo JaeHyeong on 20/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

   
   @IBOutlet weak var userNameLb: UILabel!
   @IBOutlet weak var signInBtn: UIButton!
   @IBOutlet weak var signUpBtn: UIButton!
   @IBOutlet weak var goToChatBtn: UIButton!
   @IBOutlet weak var signOutBtn: UIButton!
   
   
    override func viewDidLoad() {
      super.viewDidLoad()
      
      if let user = Auth.auth().currentUser {
         signInBtn.isHidden = true
         signUpBtn.isHidden = true
         userNameLb.text = user.email
      } else {
         goToChatBtn.isHidden = true
         signOutBtn.isHidden = true
      }
    }

   
   @IBAction func signInPressed(_ sender: UIButton) {
   }
   
   @IBAction func signUpPressed(_ sender: UIButton) {
   }
   
   
   @IBAction func signOutBtnPressed(_ sender: UIButton) {
      do {
         try Auth.auth().signOut()
         
         signInBtn.isHidden = false
         signUpBtn.isHidden = false
         goToChatBtn.isHidden = true
         signOutBtn.isHidden = true
         userNameLb.text = ""
         
      } catch {
         print(error.localizedDescription)
      }
   }
   

}

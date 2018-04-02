//
//  SignInViewController.swift
//  Open_Chat_Now
//
//  Created by Seo JaeHyeong on 20/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignInViewController: UIViewController {

   
   @IBOutlet weak var emailTf: UITextField!
   @IBOutlet weak var pwTf: UITextField!
   @IBOutlet weak var errorLb: UILabel!
   
   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
   
   @IBAction func signInBtnPressed(_ sender: UIButton) {
      SVProgressHUD.show()
      
      Auth.auth().signIn(withEmail: emailTf.text!, password: pwTf.text!) {
         (user, error) in
            if error != nil {
               print(error!.localizedDescription)
               SVProgressHUD.dismiss()
               self.errorLb.text = error!.localizedDescription
            } else {
               print("Sign In Success")
               SVProgressHUD.dismiss()
               //self.performSegue(withIdentifier: "goToChat", sender: self)
               let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController

               self.present(nextVC, animated: true)
            }
      }
   }
   

}

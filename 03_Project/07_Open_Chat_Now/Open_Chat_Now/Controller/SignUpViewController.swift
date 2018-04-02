//
//  SignUpViewController.swift
//  Open_Chat_Now
//
//  Created by Seo JaeHyeong on 20/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignUpViewController: UIViewController {

   
   @IBOutlet weak var emailTf: UITextField!
   @IBOutlet weak var pwTf: UITextField!
   @IBOutlet weak var errorLb: UILabel!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
   }

   
   // Sign Up 버튼을 누르면 Firebase의 이메일 인증을 통한 유저 등록을 진행한다.
   @IBAction func signUpBtnPressed(_ sender: UIButton) {
      SVProgressHUD.show()
      
      Auth.auth().createUser(withEmail: emailTf.text!, password: pwTf.text!) {
         (user, error) in 
         if error != nil {
            print(error.debugDescription)
            SVProgressHUD.dismiss()
            // 이메일 형식, 패스워드 길이, 등록된 이메일 등을 체크하여 에러메세지를 표시한다.
            self.errorLb.text = error?.localizedDescription
         } else {
            print("User registration Success")
            SVProgressHUD.dismiss()
            //self.performSegue(withIdentifier: "goToChat", sender: self)
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
            
            self.present(nextVC, animated: true)
         }
      }
   }
   
}

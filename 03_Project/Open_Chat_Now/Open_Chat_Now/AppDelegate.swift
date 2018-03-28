//
//  AppDelegate.swift
//  Open_Chat_Now
//
//  Created by Seo JaeHyeong on 19/03/2018.
//  Copyright © 2018 Seo Jaehyeong. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?


   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
      return true
   }

}


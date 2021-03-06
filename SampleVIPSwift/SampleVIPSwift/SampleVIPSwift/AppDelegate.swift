//
//  AppDelegate.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let firstSceneVC = LoginViewController(factory: AppInjector(), mainView: LoginView(), dataSource: LoginModel.DataSource())
    window = UIWindow.init(frame: UIScreen.main.bounds)
    
    window?.makeKeyAndVisible()
    window?.rootViewController = firstSceneVC
    
    return true
  }

}


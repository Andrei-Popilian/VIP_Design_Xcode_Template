//
//  AppDelegate.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let factoryInjector = AppInjector.FirstSceneInjector.shared
    let firstSceneVC = FirstSceneViewController(factory: factoryInjector, mainView: FirstSceneView(), dataSource: FirstSceneModel.DataSource(testVariable: 2))
    window = UIWindow.init(frame: UIScreen.main.bounds)
    
    window?.makeKeyAndVisible()
    window?.rootViewController = firstSceneVC
    
    return true
  }

}


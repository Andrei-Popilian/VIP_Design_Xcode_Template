//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol ___VARIABLE_sceneName___Routing {
  
  func routeTo(_ route: ___VARIABLE_sceneName___Model.Route)
}

final class ___VARIABLE_sceneName___Router {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - ___VARIABLE_sceneName___Routing
extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___Routing {
  
  func routeTo(_ route: ___VARIABLE_sceneName___Model.Route) {
    DispatchQueue.main.async {
      switch route {
        
      case .dismiss___VARIABLE_sceneName___Scene:
        self.dismiss___VARIABLE_sceneName___Scene()
        
      case .xScene(let data):
        self.showXSceneBy(data)
      }
    }
  }
}


// MARK: - Private Zone
private extension ___VARIABLE_sceneName___Router {
  
  func dismiss___VARIABLE_sceneName___Scene() {
    viewController?.dismiss(animated: true)
  }
  
  func showXSceneBy(_ data: Int) {
    print("will show the next screen")
  }
}

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


import Foundation

enum ___VARIABLE_sceneName___Model {
  
  enum Request {
    case doSomething(item: Int)
  }
  
  enum Response {
    case doSomething(newItem: Int, isItem: Bool)
  }
  
  enum ViewModel {
    case doSomething(viewModelData: NSObject)
  }
  
  enum Route {
    case dismiss___VARIABLE_sceneName___Scene
    case xScene(xData: Int)
  }
  
  struct DataSource {
    //var test: Int
  }
}
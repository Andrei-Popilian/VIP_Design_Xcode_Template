//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import XCTest
@testable import ___PROJECTNAME___

struct ___VARIABLE_sceneName___InjectorTest: Injectable {
  static let shared: ___VARIABLE_sceneName___InjectorTest = ___VARIABLE_sceneName___InjectorTest()
  private init() {}
}

//use the factory Dependency injection and implement the factorable protocol
extension ___VARIABLE_sceneName___InjectorTest: ___VARIABLE_sceneName___Factorable, ___VARIABLE_sceneName___ServicesFactorable {
  
  func makeRouter(viewController: UIViewController?) -> ___VARIABLE_sceneName___Routing {
    var router = ___VARIABLE_sceneName___Router(viewController)
    //custom implementation for this test
    return router
  }
  
}

class ___VARIABLE_sceneName___SceneTests: XCTestCase {
  
  var vc: ___VARIABLE_sceneName___ViewController<___VARIABLE_sceneName___InjectorTest>!
  
  override func setUp() {
    
    let customDataSource = ___VARIABLE_sceneName___Model.DataSource()
    let cusomtView = ___VARIABLE_sceneName___View()
    
    vc = ___VARIABLE_sceneName___ViewController(factory: ___VARIABLE_sceneName___InjectorTest.shared, mainView: cusomtView, dataSource: customDataSource)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() {
    
    vc.displayViewModel(.doSomething(viewModelData: NSObject()))
  }
}
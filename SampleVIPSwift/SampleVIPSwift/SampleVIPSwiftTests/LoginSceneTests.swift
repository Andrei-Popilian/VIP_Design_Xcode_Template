//
//  LoginSceneTests.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 24/11/2019.
//  Copyright (c) 2019 Andrei Popilian. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import XCTest
@testable import SampleVIPSwift

struct LoginInjectorTest: Injectable {
  static let shared: LoginInjectorTest = LoginInjectorTest()
  private init() {}
}

//use the factory Dependency injection and implement the factorable protocol
extension LoginInjectorTest: LoginFactorable, LoginServicesFactorable {
  
  func makeRouter(viewController: UIViewController?) -> LoginRouting {
    var router = LoginRouter(viewController)
    //custom implementation for this test
    return router
  }
  
}

class LoginSceneTests: XCTestCase {
  
  var vc: LoginViewController<LoginInjectorTest>!
  var customDataSource: LoginModel.DataSource!
  
  override func setUp() {
    
    customDataSource = LoginModel.DataSource(testVariable: 29)
    let customView = LoginView()
    
    vc = LoginViewController(factory: LoginInjectorTest.shared, mainView: customView, dataSource: customDataSource)
  }
  
  override func tearDown() { }
  
  func testCustomInteractorDataSourceShouldChange() {
    
    XCTAssertTrue(customDataSource.testVariable == 29, "Test Variable should be 29")
    
    vc.doSomethingToInteractor()
    
    let currentDataSource = vc.getCurrentDataSource()
    
    XCTAssertTrue(currentDataSource.testVariable == 30, "Test Variable should be 30 After")
  }
}
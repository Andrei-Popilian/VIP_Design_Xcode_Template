//
//  LoginRouterTests.swift
//  SampleVIPSwiftTests
//
//  Created by Popilian Andrei on 12/15/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//


import XCTest
@testable import SampleVIPSwift


final class LoginRouterTests: XCTestCase {
  
  private static var router: LoginRouting!
  private var viewController: LoginViewControllerSpy!
  
  override func setUp() {
    viewController = LoginViewControllerSpy(factory: LoginInjectorTest(), mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    viewController = nil
    LoginRouterTests.router = nil
  }
  
  func testLoginRouterShouldDismissViewController() {
    
    XCTAssertFalse(viewController.isDismissed)
    viewController.deinitExpectation = expectation(description: "LoginViewControllerDeinited")
    LoginRouterTests.router.routeTo(.dismissLoginScene)
    
    waitForExpectations(timeout: 1, handler: nil)
    
    XCTAssertTrue(viewController.isDismissed)
  }
}


// MARK: - Spy Classes Setup
private extension LoginRouterTests {

  struct LoginInjectorTest: LoginFactorable {

    func makeRouter(viewController: UIViewController?) -> LoginRouting {
      router = LoginRouter(viewController)
      return router
    }
  }

  final class LoginViewControllerSpy: LoginViewController {
    var deinitExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      deinitExpectation.fulfill()
    }
  }
}

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
  
  private var router: LoginRouting!
  private var viewController: LoginViewControllerSpy!
  
  override func setUp() {
    viewController = LoginViewControllerSpy()
    router = LoginRouter(viewController)
  }
  
  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension LoginRouterTests {
  
  func testLoginRouterShouldDismissViewController() {
    
    XCTAssertFalse(viewController.isDismissed)
    viewController.dismissExpectation = expectation(description: "dismissExpectation")
    
    router.routeTo(.dismissLoginScene)
    wait(for: [viewController.dismissExpectation], timeout: 0.1)
    
    XCTAssertTrue(viewController.isDismissed)
  }
}


// MARK: - Spy Classes Setup
private extension LoginRouterTests {
  
  final class LoginViewControllerSpy: UIViewController {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      dismissExpectation.fulfill()
    }
  }
}

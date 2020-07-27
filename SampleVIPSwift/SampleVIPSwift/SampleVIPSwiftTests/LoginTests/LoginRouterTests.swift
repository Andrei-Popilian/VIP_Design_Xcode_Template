//
//  LoginRouterTests.swift
//  SampleVIPSwiftTests
//
//  Created by Popilian Andrei on 12/15/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//


import XCTest
@testable import SampleVIPSwift


final class LoginRouterTests: XCTestCase, LoginFactorable {
  
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
  
  func testLoginRouterShouldDismissViewController() {
    
    XCTAssertFalse(viewController.isDismissed)
    viewController.deinitExpectation = expectation(description: "deinitExpectation")

    router.routeTo(.dismissLoginScene)
    wait(for: [viewController.deinitExpectation], timeout: 0.1)
    
    XCTAssertTrue(viewController.isDismissed)
  }
}


// MARK: - Spy Classes Setup
private extension LoginRouterTests {

  final class LoginViewControllerSpy: UIViewController {
    var deinitExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      deinitExpectation.fulfill()
    }
  }
}

//
//  LoginPresenterTests.swift
//  SampleVIPSwiftTests
//
//  Created by Popilian Andrei on 12/15/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//


import XCTest
@testable import SampleVIPSwift


final class LoginPresenterTests: XCTestCase {
  
  private var presenter: LoginPresenter!
  private var viewController: LoginViewControllerSpy!
  
  override func setUp() {
    viewController = LoginViewControllerSpy()
    presenter = LoginPresenter(viewController)
  }
  
  override func tearDown() {
    viewController = nil
    presenter = nil
  }
  
  func testLoginPresenterShouldSendUserIdToPresenterProperly() {
    
    XCTAssertNil(viewController.passedUserId)
    let testUserId = "84fnfn4jfd"
    presenter.presentResponse(.authenticate(withUserId: testUserId))

    XCTAssertEqual(viewController.passedUserId, testUserId + "test")
  }
}



// MARK: - Spy Classes Setup
private extension LoginPresenterTests {

  final class LoginViewControllerSpy: UIViewController, LoginDisplayLogic {
    var passedUserId: String!
    
    func displayViewModel(_ viewModel: LoginModel.ViewModel) {
      
      switch viewModel {
      case let .authenticate(userId):
        passedUserId = userId
      }
    }
  }
}

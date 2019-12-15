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
  
  private static var presenter: LoginPresenter!
  private static var authExpectation: XCTestExpectation?
  private static var resultUserId: String!
  
  private var viewController: LoginDisplayLogic!

  
  struct LoginInjectorTest: LoginFactorable {
    
    func makePresenter(_ viewController: LoginDisplayLogic?) -> LoginPresentationLogic {
      presenter = LoginPresenter(viewController)
      return presenter
    }
  }
  
  final class LoginTestViewController: LoginViewController {
    
    override func displayViewModel(_ viewModel: LoginModel.ViewModel) {
      
      switch viewModel {
      case .authenticate(let userId):
        print(userId)
        resultUserId = userId
      }
    }
  }

  override func setUp() {
    viewController = LoginTestViewController(factory: LoginInjectorTest(), mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    LoginPresenterTests.presenter = nil
    LoginPresenterTests.authExpectation = nil
    LoginPresenterTests.resultUserId = nil
  }
  
  func testLoginPresenterShouldAuthenticateSuccessfullAndSendUserIdToPresenter() {
    
    let beforeUserId = "84fnfn4jfd"
    LoginPresenterTests.presenter.presentResponse(.authenticate(withUserId: beforeUserId))
    
    XCTAssertNotNil(LoginPresenterTests.resultUserId)
    XCTAssert(beforeUserId != LoginPresenterTests.resultUserId)
    XCTAssert(LoginPresenterTests.resultUserId == (beforeUserId + "test"))
  }
}

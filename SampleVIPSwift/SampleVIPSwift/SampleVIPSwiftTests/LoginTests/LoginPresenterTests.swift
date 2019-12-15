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
  private var viewController: LoginViewControllerSpy!
  
  struct LoginInjectorTest: LoginFactorable {
    
    func makePresenter(_ viewController: LoginDisplayLogic?) -> LoginPresentationLogic {
      presenter = LoginPresenter(viewController)
      return presenter
    }
  }
  
  final class LoginViewControllerSpy: LoginViewController {
    var resultUserId: String!
    
    override func displayViewModel(_ viewModel: LoginModel.ViewModel) {
      
      switch viewModel {
      case .authenticate(let userId):
        resultUserId = userId
      }
    }
  }

  override func setUp() {
    viewController = LoginViewControllerSpy(factory: LoginInjectorTest(), mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    viewController = nil
    LoginPresenterTests.presenter = nil
  }
  
  func testLoginPresenterShouldAuthenticateSuccessfullAndSendUserIdToPresenter() {
    
    XCTAssertNil(viewController.resultUserId)
    let beforeUserId = "84fnfn4jfd"
    LoginPresenterTests.presenter.presentResponse(.authenticate(withUserId: beforeUserId))
    
    XCTAssertNotNil(viewController.resultUserId)
    XCTAssert(beforeUserId != viewController.resultUserId)
    XCTAssert(viewController.resultUserId == (beforeUserId + "test"))
  }
}

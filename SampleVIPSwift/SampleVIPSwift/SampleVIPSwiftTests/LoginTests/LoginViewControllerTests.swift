//
//  LoginViewControllerTests.swift
//  SampleVIPSwiftTests
//
//  Created by Popilian Andrei on 12/15/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//


import XCTest
@testable import SampleVIPSwift


final class LoginViewControllerTests: XCTestCase {
  
  private static var interactor: LoginInteractor!
  private var viewController: LoginViewControllerSpy!
  
  struct LoginTestInjector: LoginFactorable {
    
    func makeInteractor(factory: LoginPresenterFactorable & LoginServicesFactorable, viewController: LoginDisplayLogic?, dataSource: LoginModel.DataSource) -> LoginInteractable {
      interactor = LoginInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
      return interactor
    }
  }
  
  final class LoginViewControllerSpy: LoginViewController {
    var authExpectation: XCTestExpectation!
    var resultUserId: String!
    
    override func displayViewModel(_ viewModel: LoginModel.ViewModel) {
      switch viewModel {
      case .authenticate(let userId):
        resultUserId = userId
        authExpectation.fulfill()
      }
    }
  }
  
  override func setUp() {
    viewController = LoginViewControllerSpy(factory: LoginTestInjector(), mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    LoginViewControllerTests.interactor = nil
    viewController = nil
  }
  
  func testLoginInteractorShouldAuthenticateSuccessfullAndSendUserIdToViewController() {
    
    XCTAssertTrue(LoginViewControllerTests.interactor.dataSource.userId == nil, "UserId should be nil at this step")
    
    viewController.authExpectation = expectation(description: "Authentication")
    LoginViewControllerTests.interactor.doRequest(.authenticate(withEmail: "email", andPassword: "password"))
    
    waitForExpectations(timeout: 3, handler: nil)
    
    let userId = viewController.resultUserId
    XCTAssertNotNil(userId)
    XCTAssert(userId == "88f48f34jf3498fnvbtest", "UserId should be 88f48f34jf3498fnvbtest, instead it is \(userId!)")
  }
}

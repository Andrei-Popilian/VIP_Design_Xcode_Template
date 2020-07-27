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
  
  private var interactor: LoginInteractorSpy!
  private var viewController: LoginViewController!
  
  override func setUp() {
    viewController = LoginViewController(factory: LoginTestInjector(), mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    interactor = nil
    viewController = nil
  }
  
  func testLoginInteractorShouldAuthenticateSuccessfullAndSendUserIdToViewController() {
    
    XCTAssertTrue(interactor.dataSource.userId == nil, "UserId should be nil at this step")
    
    viewController.authExpectation = expectation(description: "Authentication")
    interactor.doRequest(.authenticate(withEmail: "email", andPassword: "password"))
    
    waitForExpectations(timeout: 3, handler: nil)
    
    let userId = viewController.resultUserId
    XCTAssertNotNil(userId)
    XCTAssert(userId == "88f48f34jf3498fnvbtest", "UserId should be 88f48f34jf3498fnvbtest, instead it is \(userId!)")
  }
}


// MARK: - LoginFactorable, Injector
extension LoginViewControllerTests: LoginFactorable {

  struct LoginTestInjector: LoginFactorable {

    func makeInteractor(factory: InteractableFactory,
                        viewController: LoginDisplayLogic?,
                        dataSource: LoginModel.DataSource) -> LoginInteractable {
      interactor = LoginInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
      return interactor
    }
  }
}


// MARK: - Spy Classes Setup
private extension LoginViewControllerTests {

  final class LoginInteractorSpy: LoginBusinessLogic {

    func doRequest(_ request: LoginModel.Request) {

    }
  }

  
//  final class LoginViewControllerSpypleas {
//    var authExpectation: XCTestExpectation!
//    var resultUserId: String!
//
//    override func displayViewModel(_ viewModel: LoginModel.ViewModel) {
//      switch viewModel {
//      case .authenticate(let userId):
//        resultUserId = userId
//        authExpectation.fulfill()
//      }
//    }
//  }
}

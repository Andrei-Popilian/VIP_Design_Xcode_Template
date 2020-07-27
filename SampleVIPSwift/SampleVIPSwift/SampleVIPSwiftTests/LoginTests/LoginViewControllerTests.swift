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
    viewController = LoginViewController(factory: self, mainView: LoginView(), dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    interactor = nil
    viewController = nil
  }
  
  func testSendActionsBackWillPassDataProperly() {

    let testEmail = "iPhone"
    let testPass = "15fsdf4343"
    viewController.sendActionsBackToViewController(email: testEmail, password: testPass)
    
    XCTAssertEqual(testEmail, interactor.passedEmail, "testEmail should be equal to interacto's passedEmail")
    XCTAssertEqual(testPass, interactor.passedPassword, "testPass should be equal to interacto's passedPassword")
  }
}


// MARK: - LoginFactorable, Injector
extension LoginViewControllerTests: LoginFactorable {

  func makeInteractor(factory: InteractableFactory,
                      viewController: LoginDisplayLogic?,
                      dataSource: LoginModel.DataSource) -> LoginInteractable {
    interactor = LoginInteractorSpy(dataSource: dataSource)
    return interactor
  }
}


// MARK: - Spy Classes Setup
private extension LoginViewControllerTests {

  final class LoginInteractorSpy: LoginInteractable {
    var dataSource: LoginModel.DataSource

    var passedEmail: String!
    var passedPassword: String!

    init(dataSource: LoginModel.DataSource) {
      self.dataSource = dataSource
    }

    func doRequest(_ request: LoginModel.Request) {

      switch request {
      case let .authenticate(email, password):
        passedEmail = email
        passedPassword = password
      }
    }
  }

  final class LoginRouterSpy: LoginRouting {

    func routeTo(_ route: LoginModel.Route) {

    }
  }
}

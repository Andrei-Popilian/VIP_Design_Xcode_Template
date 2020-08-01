//
//  LoginInteractorTests.swift
//  SampleVIPSwiftTests
//
//  Created by Popilian Andrei on 12/14/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import XCTest
@testable import SampleVIPSwift


final class LoginInteractorTests: XCTestCase {
  
  private var presenter: LoginPresenterSpy!
  private var interactor: LoginInteractor!
  private var authService: AuthServiceSpy!
  
  override func setUp() {
    interactor = LoginInteractor(factory: self, viewController: nil, dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    presenter = nil
    interactor = nil
    authService = nil
  }
}


// MARK: - Tests
extension LoginInteractorTests {
  
  func testAuthenticate() {
    presenter.authExpectation = expectation(description: "authExpectation")
    
    XCTAssertTrue(interactor.dataSource.userId == nil, "UserId should be nil at this step")
    
    let testEmail = "email11"
    let testPassword = "pass122"
    interactor.doRequest(.authenticate(withEmail: testEmail, andPassword: testPassword))
    
    wait(for: [presenter.authExpectation], timeout: 0.1)
    
    XCTAssertEqual(testEmail, authService.passedEmail)
    XCTAssertEqual(testPassword, authService.passedPassword)
    XCTAssertEqual(testEmail+testPassword, presenter.passedUserId)
  }
}


// MARK: - LoginFactorable
extension LoginInteractorTests: LoginFactorable {
  
  func makePresenter(_ viewController: LoginDisplayLogic?) -> LoginPresentationLogic {
    presenter = LoginPresenterSpy()
    return presenter
  }
  
  func makeAuthService() -> AuthServiceProtocol {
    authService = AuthServiceSpy()
    return authService
  }
}


// MARK: - Spy Classes Setup
private extension LoginInteractorTests {
  
  final class LoginPresenterSpy: LoginPresentationLogic {
    var authExpectation: XCTestExpectation!
    var passedUserId: String!
    
    func presentResponse(_ response: LoginModel.Response) {
      
      switch response {
      case .authenticate(let userId):
        passedUserId = userId
        authExpectation.fulfill()
      }
    }
  }
  
  final class AuthServiceSpy: AuthServiceProtocol {
    
    var passedEmail: String!
    var passedPassword: String!
    
    func doAuth(withEmail email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
      passedEmail = email
      passedPassword = password
      
      let userId = email + password
      completion(.success(userId))
    }
  }
}

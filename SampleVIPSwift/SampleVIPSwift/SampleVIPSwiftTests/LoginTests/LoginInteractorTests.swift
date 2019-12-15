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
  
  private static var presenter: LoginPresenterSpy!
  private var interactor: LoginInteractor!
  
  struct LoginTestInjector: LoginFactorable {
    
    func makePresenter(_ viewController: LoginDisplayLogic?) -> LoginPresentationLogic {
      presenter = LoginPresenterSpy()
      return presenter
    }
  }
  
  final class LoginPresenterSpy: LoginPresentationLogic {
    var authExpectation: XCTestExpectation!
    var resultUserId: String!
    
    func presentResponse(_ response: LoginModel.Response) {
      
      switch response {
      case .authenticate(let userId):
        resultUserId = userId
        authExpectation.fulfill()
      }
    }
  }
  
  override func setUp() {
    interactor = LoginInteractor(factory: LoginTestInjector(), viewController: nil, dataSource: LoginModel.DataSource())
  }
  
  override func tearDown() {
    LoginInteractorTests.presenter = nil
    interactor = nil
  }
  
  func testLoginInteractorShouldAuthenticateSuccessfullAndSendUserIdToPresenter() {
    
    XCTAssertTrue(interactor.dataSource.userId == nil, "UserId should be nil at this step")
    
    LoginInteractorTests.presenter.authExpectation = expectation(description: "Authentication")
    interactor.doRequest(.authenticate(withEmail: "email", andPassword: "password"))
    
    waitForExpectations(timeout: 3, handler: nil)
    
    let userId = LoginInteractorTests.presenter.resultUserId
    XCTAssertNotNil(userId)
    XCTAssert(userId == "88f48f34jf3498fnvb", "UserId should be 88f48f34jf3498fnvb, instead it is \(userId!)")
  }
}

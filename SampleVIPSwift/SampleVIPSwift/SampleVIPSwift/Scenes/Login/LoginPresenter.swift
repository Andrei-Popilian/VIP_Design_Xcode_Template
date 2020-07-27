//
//  LoginPresenter.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 24/11/2019.
//  Copyright (c) 2019 Andrei Popilian. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol LoginPresentationLogic {
  
  func presentResponse(_ response: LoginModel.Response)
}

final class LoginPresenter {
  
  private weak var viewController: LoginDisplayLogic?
  
  required init(_ viewController: LoginDisplayLogic?) {
    self.viewController = viewController
  }
}


//MARK: - LoginPresentationLogic
extension LoginPresenter: LoginPresentationLogic {
  
  func presentResponse(_ response: LoginModel.Response) {
    
    switch response {
      
    case .authenticate(let userId):
      presentAuthenticateSuccess(withUserId: userId)
    }
  }
}


//MARK: - Private Zone
private extension LoginPresenter {
  
  func presentAuthenticateSuccess(withUserId userId: String) {
    
    //prepare data for display and send it further
    //for test purpose we will change the userId bit
    let newUserID = userId + "test"
    
    viewController?.displayViewModel(.authenticate(withUserId: newUserID))
  }
}

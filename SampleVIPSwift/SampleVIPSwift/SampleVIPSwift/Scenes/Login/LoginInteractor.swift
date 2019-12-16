//
//  LoginInteractor.swift
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

typealias LoginInteractable = LoginBusinessLogic & LoginDataStore

protocol LoginBusinessLogic {
  
  func doRequest(_ request: LoginModel.Request)
}

protocol LoginDataStore {
  var dataSource: LoginModel.DataSource { get }
}

final class LoginInteractor: Interactable, LoginDataStore {
  
  var dataSource: LoginModel.DataSource
  
  private var factory: LoginInteractorFactorable.InteractableFactory
  private var presenter: LoginPresentationLogic
  
  init(factory: LoginInteractorFactorable.InteractableFactory, viewController: LoginDisplayLogic?, dataSource: LoginModel.DataSource) {
    self.factory = factory
    self.dataSource = dataSource
    self.presenter = factory.makePresenter(viewController)
  }
}


//MARK: - LoginBusinessLogic
extension LoginInteractor: LoginBusinessLogic {
  
  func doRequest(_ request: LoginModel.Request) {
    DispatchQueue.global(qos: .userInitiated).async {
      
      switch request {
        
      case .authenticate(let email, let password):
        self.doAuthentication(withEmail: email, andPassword: password)
      }
    }
  }
}


//MARK: - Private Zone
private extension LoginInteractor {
  
  
  func doAuthentication(withEmail email: String, andPassword password: String) {
    
    let authService = factory.makeAuthService()
    
    authService.doAuth(withEmail: email, password: password, completion: { [weak self] result in
      guard let self = self else { return }
      
      switch result {
        
      case .failure(let error):
        print(error)
        //do error handling or pass to error handler
        
      case .success(let userId):
        self.dataSource.userId = userId
        self.presenter.presentResponse(.authenticate(withUserId: userId))
      }
    })
  }
}

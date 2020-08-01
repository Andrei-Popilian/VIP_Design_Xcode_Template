//
//  LoginFactorable.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 24/11/2019.
//  Copyright (c) 2019 Andrei Popilian. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

extension AppInjector: LoginFactorable  {

  struct LoginInjector {}
}

extension AppInjector.LoginInjector: LoginFactorable {}

protocol LoginFactorable: LoginInteractorFactorable, LoginPresenterFactorable,
                          LoginRouterFactorable, LoginServicesFactorable {}

protocol LoginInteractorFactorable {
  typealias InteractableFactory = LoginPresenterFactorable & LoginServicesFactorable
  
  func makeInteractor(factory: InteractableFactory,
                      viewController: LoginDisplayLogic?,
                      dataSource: LoginModel.DataSource) -> LoginInteractable
}

protocol LoginPresenterFactorable {
  func makePresenter(viewController: LoginDisplayLogic?) -> LoginPresentationLogic
}

protocol LoginRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> LoginRouting
}


// MARK: - VIP Factory
extension LoginFactorable {
  
  func makeInteractor(factory: InteractableFactory,
                      viewController: LoginDisplayLogic?,
                      dataSource: LoginModel.DataSource) -> LoginInteractable {
    
    LoginInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: LoginDisplayLogic?) -> LoginPresentationLogic {
    LoginPresenter(viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> LoginRouting {
    LoginRouter(viewController)
  }
}


//MARK: - Services Factory
protocol LoginServicesFactorable {
  
  func makeAuthService() -> AuthServiceProtocol
}

extension LoginServicesFactorable {
  
  func makeAuthService() -> AuthServiceProtocol {
    AuthService()
  }
}

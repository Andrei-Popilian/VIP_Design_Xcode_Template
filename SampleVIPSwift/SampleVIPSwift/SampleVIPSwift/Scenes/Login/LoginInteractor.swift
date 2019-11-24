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

final class LoginInteractor<Factory>: Interactable, LoginDataStore where Factory: LoginServicesFactorable & LoginFactorable {
  
  var dataSource: LoginModel.DataSource
  
  private var factory: Factory
  private var presenter: LoginPresentationLogic
  
  init(factory: Factory, viewController: LoginDisplayLogic?, dataSource: LoginModel.DataSource) {
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
        
      case .doSomething(let item):
        self.doSomething(item)
      }
    }
  }
}


//MARK: - Private Zone
private extension LoginInteractor {
  
  func doSomething(_ item: Int) {
    
    //construct the Service right before using it
    //let serviceX = factory.makeXService()
    
    // get new data async or sync
    //let newData = serviceX.getNewData()
    
    dataSource.testVariable = item + 1

    presenter.presentResponse(.doSomething(newItem: item + 1, isItem: true))

  }
}
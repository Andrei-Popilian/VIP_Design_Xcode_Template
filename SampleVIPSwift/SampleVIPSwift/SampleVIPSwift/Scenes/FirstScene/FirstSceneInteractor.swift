//
//  FirstSceneInteractor.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright (c) 2019 Andrei Popilian. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

typealias FirstSceneInteractable = FirstSceneBusinessLogic & FirstSceneDataStore

protocol FirstSceneBusinessLogic {
    
    func doRequest(_ request: FirstSceneModel.Request)
}

protocol FirstSceneDataStore {
    var dataSource: FirstSceneModel.DataSource { get }
}

final class FirstSceneInteractor<Factory>: Interactable, FirstSceneDataStore where Factory: FirstSceneFactorable {
    
    var dataSource: FirstSceneModel.DataSource
    
    private var factory: Factory
    private var presenter: FirstScenePresentationLogic
    
    init(factory: Factory, viewController: FirstSceneDisplayLogic?, dataSource: FirstSceneModel.DataSource) {
        self.factory = factory
        self.dataSource = dataSource
        self.presenter = factory.makePresenter(viewController)
    }
}


//MARK: - FirstSceneBusinessLogic
extension FirstSceneInteractor: FirstSceneBusinessLogic {
    
    func doRequest(_ request: FirstSceneModel.Request) {
        
        switch request {
            
        case .doSomething(let item):
            doSomething(item)
        }
    }
}


//MARK: - Private Zone
private extension FirstSceneInteractor {
    
    func doSomething(_ item: Int) {
        
        //use a Service or use the service here if that is not expensive
        //let serviceX = factory.makeXService()
        
        // get new data async or sync
        //let newData = serviceX.getNewData()
      
           dataSource.testVariable = item + 1
        presenter.presentResponse(.doSomething(item + 1, true))
     
    }
}

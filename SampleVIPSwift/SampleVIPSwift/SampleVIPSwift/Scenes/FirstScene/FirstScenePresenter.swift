//
//  FirstScenePresenter.swift
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

protocol FirstScenePresentationLogic {
    func presentResponse(_ response: FirstSceneModel.Responses)
}

final class FirstScenePresenter: Presentable {
    private weak var viewController: FirstSceneDisplayLogic?
    
    init(_ viewController: FirstSceneDisplayLogic?) {
        self.viewController = viewController
    }
}


//MARK: - FirstScenePresentationLogic
extension FirstScenePresenter: FirstScenePresentationLogic {
    
    func presentResponse(_ response: FirstSceneModel.Responses) {
        
        switch response {
            
        case .doSomething(let newItem, let isItem):
            presentDoSomething(newItem, isItem)
        }
    }
}


//MARK: - Private Zone
private extension FirstScenePresenter {
    
    func presentDoSomething(_ newItem: Int, _ isItem: Bool) {
        
        //prepare data for display and send it further
        
        viewController?.displayViewModel(.doSomething(NSObject()))
    }
}
//
//  Factorable.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import UIKit

struct AppInjector {}

protocol Injectable {}

protocol Factorable {

    associatedtype DisplayLogic
    associatedtype DataSource
    associatedtype Interactor
    associatedtype Presenter
    associatedtype Router
  
    func makeInteractor(viewController: DisplayLogic?, dataSource: DataSource) -> Interactor
    func makePresenter(_ viewController: DisplayLogic?) -> Presenter
    func makeRouter(viewController: UIViewController?) -> Router
}

protocol MainViewFactorable {
    
    associatedtype MainView
    
    func makeMainView() -> MainView
}

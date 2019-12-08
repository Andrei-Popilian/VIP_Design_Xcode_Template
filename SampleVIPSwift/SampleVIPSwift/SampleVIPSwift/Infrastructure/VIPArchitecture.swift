//
//  VIPArchitecture.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import UIKit

struct AppInjector {}

protocol Displayable where Self: UIViewController  {
  
  associatedtype Factory
  associatedtype DataSource: DataSourceable
  associatedtype View: UIView
  
  init(factory: Factory, mainView: View, dataSource: DataSource)
}

protocol Interactable {
  
  associatedtype Factory
  associatedtype DataSource: DataSourceable
  associatedtype DisplayLogic
  
  init(factory: Factory, viewController: DisplayLogic?, dataSource: DataSource)
}

protocol Presentable {
  
  associatedtype DisplayLogic
  
  init(_ viewController: DisplayLogic?)
}

protocol Routeable {
  
  init(_ viewController: UIViewController?)
}

protocol DataSourceable {}



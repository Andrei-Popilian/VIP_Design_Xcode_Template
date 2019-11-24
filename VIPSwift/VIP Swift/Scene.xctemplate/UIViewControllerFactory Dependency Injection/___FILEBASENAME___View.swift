//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ___VARIABLE_sceneName___ViewDelegate where Self: UIViewController {
  
  func sendDataBackToParent(_ data: Data)
}

final class ___VARIABLE_sceneName___View: UIView {
  
  weak var delegate: ___VARIABLE_sceneName___ViewDelegate?
  
  private enum ViewTrait {
    static let leftMargin: CGFloat = 10.0
  }
  
}

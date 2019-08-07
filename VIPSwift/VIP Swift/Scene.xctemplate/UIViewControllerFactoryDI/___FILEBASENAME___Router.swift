//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ___VARIABLE_sceneName___Routing {
    
    func routeTo(_ routes: ___VARIABLE_sceneName___Model.Routes)
}

struct ___VARIABLE_sceneName___Router: Routeable  {
    
    private weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController?) {
        self.viewController = viewController
    }
}


//MARK: - ___VARIABLE_sceneName___Routing
extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___Routing {
     func routeTo(_ routes: ___VARIABLE_sceneName___Model.Routes) {
        
        switch routes {
            
        case .xScene(let data):
            showXSceneBy(data)
        }
        
        print("Show X Screen")
    }
}


//MARK: - Private Zone
private extension ___VARIABLE_sceneName___Router {
    
    func showXSceneBy(_ data: Int) {
        print("will show the next screen")
    }
}

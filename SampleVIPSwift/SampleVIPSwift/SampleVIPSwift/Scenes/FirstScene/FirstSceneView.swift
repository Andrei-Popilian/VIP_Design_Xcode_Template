//
//  FirstSceneView.swift
//  SampleVIPSwift
//
//  Created by Andrei Popilian on 10/10/2019.
//  Copyright (c) 2019 Andrei Popilian. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FirstSceneViewDelegate where Self: UIViewController {
    
    func sendDataBackToParent(_ data: Data)
}

final class FirstSceneView: UIView {
    
    weak var delegate: FirstSceneViewDelegate?
    
    private enum ViewTraits {
        
        static let leftMargin: CGFloat = 10.0
    }
    
}

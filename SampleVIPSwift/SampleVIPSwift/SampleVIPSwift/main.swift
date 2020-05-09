//
//  main.swift
//  SampleVIPSwift
//
//  Created by Popilian Andrei on 5/9/20.
//  Copyright © 2020 Andrei Popilian. All rights reserved.
//

import UIKit

enum AppState {
  static let isRunningUnitTests = NSClassFromString("XCTestCase") != nil
}

private let appDelegateClass = AppState.isRunningUnitTests ? nil : NSStringFromClass(AppDelegate.self)
private let args = UnsafeMutablePointer<UnsafeMutablePointer<Int8>?>(CommandLine.unsafeArgv)
UIApplicationMain(CommandLine.argc, args, nil, appDelegateClass)

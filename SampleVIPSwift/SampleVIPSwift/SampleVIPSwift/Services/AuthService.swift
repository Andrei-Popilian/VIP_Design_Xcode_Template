//
//  AuthService.swift
//  SampleVIPSwift
//
//  Created by Popilian Andrei on 12/8/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import Foundation

final class AuthService {
  
  func doAuth(withEmail email: String, password: String, completion: (Result<String, Error>) -> Void) {
    
    //doAuthRequest using other services injected through init
    let userId = "88f48f34jf3498fnvb"
    completion(.success(userId))
  }
}

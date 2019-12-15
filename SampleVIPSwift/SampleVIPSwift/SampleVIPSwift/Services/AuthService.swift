//
//  AuthService.swift
//  SampleVIPSwift
//
//  Created by Popilian Andrei on 12/8/19.
//  Copyright © 2019 Andrei Popilian. All rights reserved.
//

import Foundation

final class AuthService {
  
  func doAuth(withEmail email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
    
    //doAuthRequest using other services injected through init
    let userId = "88f48f34jf3498fnvb"
    
    //simulate a server request
    DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 2, execute: {
      completion(.success(userId))
    })
  }
}

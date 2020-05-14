//
//  LoginBrain.swift
//  LoginPage_Exercise
//
//  Created by Kas Song on 2020.05.14.
//  Copyright © 2020 Kas Song. All rights reserved.
//

import Foundation

struct LoginBrain {
    var userInfo = [
        "Admin@admin.com": "admin",
        "KasRoid@gmail.com": "password",
        "1234": "1234"
    ]
    
    var isCorrect = false
    
    mutating func loginCheck(id: String, pw: String) -> Bool {
        guard userInfo[id] != nil else {
            return false
        }
        guard userInfo[id] == pw else {
            return false
        }
        isCorrect = true
        return isCorrect
    }
    
    mutating func signupAction(id: String, pw: String) {
        userInfo[id] = pw
        print(id, pw)
    }
}


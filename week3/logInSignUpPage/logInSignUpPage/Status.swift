//
//  Status.swift
//  logInSignUpPage
//
//  Created by Astrid on 2021/8/11.
//

import Foundation

enum Status: String {
    
    case accountEmpty = "Account should not be empty."
    case checkEmpty = "Check Password should not be empty."
    case passwordEmpty = "Password should not be empty."
    case passwordNotEqualToCheck = "SignUp fail"
    
    case invalidAccountPassword = "Login fail."
}

enum Mode:Int {
    case logIn
    case signUp
}

struct Valid {
    
    static let account = "appworks_school@gmail.com"
    static let password = "1234"
}




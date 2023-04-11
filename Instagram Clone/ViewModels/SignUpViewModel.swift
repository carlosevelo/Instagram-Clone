//
//  SignUpViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/4/23.
//

import Foundation

class SignUpViewModel : ObservableObject {
    
    
    func SignUp(_ email: String, _ fullName: String, _ username: String, _ password: String) {
        AuthService.SignUp(email: email, fullName: fullName, username: username, password: password)
    }
}

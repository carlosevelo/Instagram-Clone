//
//  SignInViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/7/23.
//

import Foundation

class SignInViewModel : ObservableObject {
    @Published var signedIn = false
    
    func SignIn(_ email: String, _ password: String) {
        let success = AuthService.SignIn(email: email, password: password)
        if success {
            signedIn = true
        } else {
            signedIn = false
        }
    }
}

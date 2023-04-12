//
//  AuthService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/7/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService : ObservableObject {
    @Published var signedIn = false
    @Published var signInError = false
    
    static var storeRoot = Firestore.firestore()
//    private var _userService: UserService
//    
//    init(userService: UserService) {
//        _userService = userService
//    }
//
    func SignUp(_ email: String, _ fullName: String, _ username: String, _ password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                return
            }
            guard let user = authData?.user else {return}
            UserDefaults.standard.set(user.uid, forKey: "uid")
            UserDefaults.standard.set(user.displayName, forKey: "displayName")
            self.signedIn = true
        }
    }
    
    func SignIn(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                return
            }
            guard let user = result?.user else {return}
            UserDefaults.standard.set(user.uid, forKey: "userId")
            self.signedIn = true
            print("Signed in.")
        }
    }
    
    func SignOut() {
        do {
            try Auth.auth().signOut()
            self.signedIn = false
            print("Signed out.")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

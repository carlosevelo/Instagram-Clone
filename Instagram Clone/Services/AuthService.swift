//
//  AuthService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/5/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class AuthService {
    static var storeRoot = Firestore.firestore()
    
    private var _userService: UserService
    
    init(userService: UserService) {
        _userService = userService
    }
    
    static func GetUserById(userId: Int) -> DocumentReference {
        return storeRoot.collection("user").document("userId")
    }
    
    static func SignUp(email: String, fullName: String, username: String, password: String) -> Bool {
        var success = false
        
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            
            if error != nil {
                return
            }
            
            guard let user = authData?.user else {return}
            UserDefaults.standard.set(user.uid, forKey: "uid")
            UserDefaults.standard.set(user.displayName, forKey: "displayName")
            success = true
        }
        
        return success
    }
    
    static func SignIn(email: String, password: String) -> Bool {
        var success = false
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                return
            }
            
            guard let user = result?.user else {return}
            UserDefaults.standard.set(user, forKey: "userId")
            success = true
        }
        
        return success
    }
}

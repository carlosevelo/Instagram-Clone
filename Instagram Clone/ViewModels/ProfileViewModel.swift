//
//  ProfileViewModel.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import Firebase
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    var userService = UserService()

    var currentUser: User? {
        let user = Auth.auth().currentUser
        if user != nil {
            return userService.GetUserByUid(uid: user!.uid)
        }
        else {
            return nil
        }
    }
    
}

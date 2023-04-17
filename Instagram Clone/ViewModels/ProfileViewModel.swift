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
    
    @Published var data = ProfileDataModel()
    
    func SaveProfile() {
        //TODO: Save to firebase
    }
    
}

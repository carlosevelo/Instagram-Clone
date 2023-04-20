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
 
    var userService = UserService()
    
    static var storeRoot = Firestore.firestore()

    func SignUp(_ email: String, _ fullName: String, _ username: String, _ password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                return
            }
            guard let user = authData?.user else {return}
            UserDefaults.standard.set(user.uid, forKey: "uid")
            
            self.signedIn = true
            
            let newUser = self.userService.CreateUser(uid: user.uid, email: email, username: username, name: fullName, profileImageUrl: "", bio: "")
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()

                // Encode Note
                let data = try encoder.encode(newUser)

                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "currentUser")

            } catch {
                print("Unable to Encode currentUser (\(error))")
            }
        }
    }
    
    func SignIn(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                return
            }
            guard let user = result?.user else {return}
            UserDefaults.standard.set(user.uid, forKey: "userId")
            
            var currentUser: User?
            self.userService.GetUserByUserId(userId: user.uid) { user in
                currentUser = user
                
                do {
                    // Create JSON Encoder
                    let encoder = JSONEncoder()

                    // Encode Note
                    let data = try encoder.encode(currentUser)

                    // Write/Set Data
                    UserDefaults.standard.set(data, forKey: "currentUser")

                } catch {
                    print("Unable to Encode user (\(error))")
                }

                self.signedIn = true
                print("Signed in.")
            }
        }
    }
    
    func SignOut() {
        do {
            try Auth.auth().signOut()
            self.signedIn = false
            UserDefaults.standard.removeObject(forKey: "currentUser")
            print("Signed out.")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

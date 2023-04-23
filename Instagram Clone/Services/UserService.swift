//
//  UserService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class UserService {
    
    let db = Firestore.firestore()

    //MARK: - Create
    func CreateUser(uid: String, email: String, username: String, name: String, profileImageUrl: URL?, bio: String) -> User {
        let user = User(userId: uid, email: email, profileImageUrl: profileImageUrl, username: username, fullName: name, bio: bio)
        
        do {
            try self.db.collection("user").document().setData(from: user)
        } catch let error {
            print("Error writing User to Firestore: \(error)")
        }
        
        return user
    }
    
    //MARK: - Get
    func GetCurrentUser() -> User? {
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            
            var user: User?
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                user = try decoder.decode(User.self, from: data)

            } catch {
                print("Unable to Decode User (\(error))")
            }
            
            if user == nil {
                print("Error: User is nil.")
                return nil
            } else {
                return user!
            }
        }
        return nil
    }
    
    func GetUserByUserId(userId: String, onComplete: @escaping (User) -> Void) {
        var userList: [User] = []
        db.collection("user").whereField("userId", isEqualTo: userId).getDocuments { querySnapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    var user: User
                    do {
                        user = try document.data(as: User.self)
                    } catch {
                        print("Error")
                        continue
                    }
                    userList.append(user)
                }
                onComplete(userList.first!)
            }
        }
    }
    
    func GetUserByUid(uid: String) -> User {
        return DummyData.dummyUser
    }
    
    func GetUserByPostId(postId: Int) -> User {
        return DummyData.dummyUser
    }
    
    func GetFollowerIdListByUserId(userId: String) -> [String] {
        return [DummyData.dummyUser.userId]
    }
    
    func GetFollowingCountByUserId(userId: String) -> String {
        return "0"
    }
    
    //MARK: - Update
    func UpdateUser(userId: String, username: String, name: String, bio: String) {
        
    }
    
    //MARK: - Delete
    func DeleteUser(userId: String) {
        
    }
    
    
}

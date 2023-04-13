//
//  UserService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class UserService {
    //MARK: - Create
    func CreateUser(uid: String, email: String, username: String, name: String, profileImage: String, bio: String) {
        
    }
    
    //MARK: - Get
    func GetUserByUserId(userId: Int) -> User {
        return DummyData.dummyUser
    }
    
    func GetUserByUid(uid: String) -> User {
        return DummyData.dummyUser
    }
    
    func GetUserByPostId(postId: Int) -> User {
        return DummyData.dummyUser
    }
    
    func GetFollowerIdListByUserId(userId: Int) -> [Int] {
        return [DummyData.dummyUser.uid]
    }
    
    func GetFollowingCountByUserId(userId: Int) -> Int {
        return 0
    }
    
    //MARK: - Update
    func UpdateUser(userId: Int, username: String, name: String, bio: String) {
        
    }
    
    //MARK: - Delete
    func DeleteUser(userId: Int) {
        
    }
    
    
}

//
//  UserService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class UserService: IUserService {
    func CreateUser(username: String, name: String, bio: String) {
        
    }
    
    func GetUserByUserId(userId: Int) -> User {
        return DummyData.dummyUser
    }
    
    func GetUserByPostId(postId: Int) -> User {
        return DummyData.dummyUser
    }
    
    func GetFollowerIdListByUserId(userId: Int) -> [Int] {
        return [DummyData.dummyUser.userId!]
    }
    
    func GetFollowingCountByUserId(userId: Int) -> Int {
        return 0
    }
    
    func UpdateUser(userId: Int, username: String, name: String, bio: String) {
        
    }
    
    func DeleteUser(userId: Int) {
        
    }
    
    
}

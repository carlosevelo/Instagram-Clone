//
//  IUserService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

protocol IUserService {
    //MARK: - Create Methods
    func CreateUser(username: String, name: String, bio: String)
    
    //MARK: - Get Methods
    func GetUserByUserId(userId: Int, onComplete: @escaping (User) -> Void)
    func GetUserByPostId(postId: Int) -> User
    func GetFollowerIdListByUserId(userId: Int) -> [Int]
    func GetFollowingCountByUserId(userId: Int) -> Int
    
    //MARK: - Update Methods
    func UpdateUser(userId: Int, username: String, name: String, bio: String)
    
    //MARK: - Delete Methods
    func DeleteUser(userId: Int)
}

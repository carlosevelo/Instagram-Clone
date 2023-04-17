//
//  IStoryService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

protocol IStoryService {
    //MARK: - Create Methods
    func CreateStory(userId: String, date: Date) //Add url
    
    //MARK: - Get Methods
    func GetStoryByUserId(chatId: Int) -> Story
    func GetStoryListByUserId(userId: Int) -> [Story]
    
    //MARK: - Update Methods
    func UpdateStory(storyId: Int, userId: Int, date: Date)
    
    //MARK: - Delete Methods
    func DeleteStory(storyId: Int)
}

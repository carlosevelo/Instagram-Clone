//
//  StoryService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class StoryService: IStoryService {
    func CreateStory(userId: String, date: Date) {
        <#code#>
    }
    
    func GetStoryByUserId(chatId: Int) -> Story {
        return DummyData.dummyStory
    }
    
    func GetStoryListByUserId(userId: Int) -> [Story] {
        return [DummyData.dummyStory]
    }
    
    func UpdateStory(storyId: Int, userId: Int, date: Date) {
        <#code#>
    }
    
    func DeleteStory(storyId: Int) {
        <#code#>
    }
    
    
}

//
//  Story.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct Story {
    
    //MARK: - Properties
    
    var storyId: Int?
    var userId: Int
    //var url:
    var date: Date
    
    //MARK: - Initialization
    
    init(userId: Int, date: Date) {
        self.userId = userId
        self.date = date
    }
}

//
//  Post.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import GRDB

struct Post: TableRecord, FetchableRecord {
    
    //MARK: - Constants
    
    struct Table {
        static let databaseTableName = "chat"
        
        static let postId = "PostId"
        static let userId = "UserId"
        static let caption = "Caption"
        static let date = "Date"
    }
    
    //MARK: - Properties
    
    var postId: Int
    var userId: Int
    //var media:
    var caption: String
    var date: Date
    
    //MARK: - Initialization
    
    init(userId: Int, caption: String, date: Date) {
        self.userId = userId
        self.caption = caption
        self.date = date
    }
    
    init(row: Row) {
        postId = row[Table.postId]
        userId = row[Table.userId]
        caption = row[Table.caption]
        date = row[Table.date]
    }
}

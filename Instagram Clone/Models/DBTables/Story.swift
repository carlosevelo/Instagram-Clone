//
//  Story.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation
import GRDB

struct Story: TableRecord, FetchableRecord {
    
    //MARK: - Constants
    
    struct Table {
        static let databaseTableName = "chat"
        
        static let storyId = "DtoryId"
        static let userId = "UserId"
        static let date = "Date"
    }
    
    //MARK: - Properties
    
    var storyId: String
    var userId: String
    //var media:
    var date: Date
    
    //MARK: - Initialization
    
    init(row: Row) {
        storyId = row[Table.storyId]
        userId = row[Table.userId]
        date = row[Table.date]
    }
}

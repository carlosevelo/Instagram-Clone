//
//  Chat.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

struct Chat {
    
    //MARK: - Properties
    
    var chatId: Int?
    var userId: Int
    var recipientId: Int
    var messages: [Message]?
    
    //MARK: - Initialization
    
    init(userId: Int, recipientId: Int, messages: [Message]?) {
        self.userId = userId
        self.recipientId = recipientId
        self.messages = messages
    }
}

struct Message {
    
    //MARK: - Properties
    
    var messageID: Int?
    var chatId: Int
    var userId: Int
    var text: String
    
    //MARK: - Initialization

    init(chatId: Int, userId: Int, text: String) {
        self.chatId = chatId
        self.userId = userId
        self.text = text
    }
}

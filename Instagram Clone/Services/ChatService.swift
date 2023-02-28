//
//  ChatService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

class ChatService: IChatService {
    func CreateChat(userId: String, recipientId: Int, messages: [Message]) {
        <#code#>
    }
    
    func GetChatByChatId(chatId: Int) -> Chat {
        return DummyData.dummyChat
    }
    
    func GetChatListByUserId(userId: Int) -> [Chat] {
        return [DummyData.dummyChat]
    }
    
    func UpdateChat(chatId: Int, userId: Int, recipientId: Int, messages: [Message]) {
        <#code#>
    }
    
    func DeleteComment(chatId: Int) {
        <#code#>
    }
    
    
}

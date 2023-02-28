//
//  IChatService.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 2/27/23.
//

import Foundation

protocol IChatService {
    //MARK: - Create Methods
    func CreateChat(userId: String, recipientId: Int, messages: [Message])
    
    //MARK: - Get Methods
    func GetChatByChatId(chatId: Int) -> Chat
    func GetChatListByUserId(userId: Int) -> [Chat]
    
    //MARK: - Update Methods
    func UpdateChat(chatId: Int, userId: Int, recipientId: Int, messages: [Message])
    
    //MARK: - Delete Methods
    func DeleteComment(chatId: Int)
}

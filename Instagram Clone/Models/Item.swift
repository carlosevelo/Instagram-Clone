//
//  Item.swift
//  Instagram Clone
//
//  Created by Carlos Evelo on 4/16/23.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let post: Post
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}

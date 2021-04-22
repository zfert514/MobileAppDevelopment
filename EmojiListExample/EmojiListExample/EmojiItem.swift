//
//  EmojiItem.swift
//  EmojiListExample
//
//  Created by Joel Hollingsworth on 3/11/21.
//

import Foundation

struct EmojiItem: Identifiable {
    let id = UUID()
    let emoji: String
    let name: String
    let description: String
}

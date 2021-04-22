//
//  EmojiListExampleApp.swift
//  EmojiListExample
//
//  Created by Joel Hollingsworth on 3/11/21.
//

import SwiftUI

@main
struct EmojiListExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(emojis: Emojis())
        }
    }
}

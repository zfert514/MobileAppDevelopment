//
//  ContentView.swift
//  EmojiListExample
//
//  Created by Joel Hollingsworth on 3/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var emojis: Emojis
    
    var body: some View {
        NavigationView {
            List(emojis.emojiList) { emojiItem in
                NavigationLink(destination: DetailsView(emojiItem: emojiItem))
                {
                    HStack {
                        EmojiCircleView(emojiItem: emojiItem)
                        Text(emojiItem.name)
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitle("Emoji")
        }
    }
}

struct DetailsView: View {
    
    let emojiItem: EmojiItem
    
    var body: some View {
        VStack {
            HStack {
                EmojiCircleView(emojiItem: emojiItem)
                    .padding(.trailing, 5)
                Text(emojiItem.name)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            Text(emojiItem.description)
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(emojiItem.name), displayMode: .inline)
    }
    
}

struct EmojiCircleView: View {
    
    let emojiItem: EmojiItem
    
    var body: some View {
        Text(emojiItem.emoji)
            .shadow(radius: 3)
            .font(.largeTitle)
            .frame(width: 65, height: 65)
            .overlay(
                Circle().stroke(Color.purple, lineWidth: 3)
            )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojis: Emojis())
    }
}

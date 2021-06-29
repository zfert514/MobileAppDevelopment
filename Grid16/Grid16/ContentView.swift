//
//  ContentView.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/15/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var isGameSceneShowing = false
    
    var body: some View {
        VStack {
            Text("Quick9")
                .fontWeight(.heavy)
                .font(.largeTitle)
            Text("HighScore: \(UserDefaults.standard.integer(forKey: "HighScore"))")
                .font(.subheadline)
                .padding()
            Text("Play")
                .onTapGesture {
                    toggleBool()
                }
            //            Text("Info")
            //            Text("Credits")
        }
        .fullScreenCover(isPresented: $isGameSceneShowing, content: {
            GameView(manager: GameManager())
        })
    }
    
    func toggleBool() {
        isGameSceneShowing.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

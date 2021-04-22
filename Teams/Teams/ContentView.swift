//
//  ContentView.swift
//  Teams
//
//  Created by Joel Hollingsworth on 3/31/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var isGameSceneShowing = false
    
    var body: some View {
        VStack {
            Button(action: { isGameSceneShowing.toggle() }, label: {
                Text("Make Teams")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .bold()
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 3))
            })
        }
        .fullScreenCover(isPresented: $isGameSceneShowing, content: {
            GameView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

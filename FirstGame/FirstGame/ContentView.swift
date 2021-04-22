//
//  ContentView.swift
//  FirstGame
//
//  Created by Zachary Fertig on 3/25/21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var gameScene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: gameScene)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

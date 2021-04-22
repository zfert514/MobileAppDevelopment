//
//  GameView.swift
//  Teams
//
//  Created by Zachary Fertig on 4/1/21.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var gameScene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        scene.gameView = self
        return scene
    }
    
    var body: some View {
       SpriteView(scene: gameScene)
    }
    
    func endScene() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

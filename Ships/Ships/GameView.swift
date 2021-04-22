//
//  GameView.swift
//  Ships
//
//  Created by Joel Hollingsworth on 4/4/21.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    var gameScene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width,
                            height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: gameScene)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

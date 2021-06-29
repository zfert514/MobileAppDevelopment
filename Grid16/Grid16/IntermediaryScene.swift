//
//  IntermediaryScene.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/11/21.
//

import SpriteKit

class IntermediaryScene: GameBase {
    
    var started = false
    
    var gameLabel = SKLabelNode(text: "speed is now")
    
    let speedLabel = SKLabelNode(text: String(1.0))
    
    override func didMove(to view: SKView) {
        if !started {
            view.showsFPS = true
            
            self.backgroundColor = .black
            
            gameLabel.position = CGPoint(x: frame.midX/2, y: frame.midY)
            addChild(gameLabel)
            
            speedLabel.removeFromParent()
            speedLabel.position = CGPoint(x: frame.maxX-frame.midX/1.5, y: frame.midY/2)
            speedLabel.fontSize = 150
            addChild(speedLabel)
            
            started = true
        }
        
        speedLabel.text = String(Float(self.physicsWorld.speed))
        
        print("Scene Speed: ", self.physicsWorld.speed)
    }
}

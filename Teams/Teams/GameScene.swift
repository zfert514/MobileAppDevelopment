//
//  GameScene.swift
//  FirstGame
//
//  Created by Joel Hollingsworth on 3/25/21.
//

import SpriteKit

class GameScene: SKScene {
    
    var gameView: GameView? = nil
    
    var touchNodes = [UITouch:SKShapeNode]()
    var startTime = 0.0
    
    override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let circle = SKShapeNode(circleOfRadius: 75)
            circle.fillColor = UIColor(.white)
            circle.lineWidth = 0
            circle.position = location
            
            addChild(circle)
            touchNodes[touch] = circle
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let circle = touchNodes[touch] {
                circle.removeFromParent()
                touchNodes.removeValue(forKey: touch)
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let circle = touchNodes[touch] {
                circle.removeFromParent()
                touchNodes.removeValue(forKey: touch)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let circle = touchNodes[touch] {
                let location = touch.location(in: self)
                circle.position = location
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if startTime == 0.0 {
            startTime = currentTime
        }
        if startTime != 0.0 && currentTime >= startTime+10 {
            print("10 seconds have passed")
            gameView?.endScene()
        }
    }
    
}

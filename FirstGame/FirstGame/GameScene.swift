//
//  GameScene.swift
//  FirstGame
//
//  Created by Zachary Fertig on 3/25/21.
//

import SpriteKit

class GameScene: SKScene {
    
    var touchNodes = [UITouch:SKShapeNode]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(touches.count)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            let circle = SKShapeNode(circleOfRadius: 50)
            circle.fillColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if let circle = touchNodes[touch] {
                let location = touch.location(in: self)
                circle.position = location
            }
        }
    }
    
}

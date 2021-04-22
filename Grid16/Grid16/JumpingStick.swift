//
//  JumpingStick.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/15/21.
//

import SpriteKit

class JumpingStick: SKShapeNode {
    
    let height = 60
    let width = 10
    
    var canJump = false
    
    let rect = SKShapeNode(rectOf: CGSize(width: 10, height: 60))
    
    override init() {
        super.init()
        
        rect.fillColor = .orange
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        rect.physicsBody?.contactTestBitMask = rect.physicsBody?.collisionBitMask ?? 0
        rect.physicsBody?.allowsRotation = false
        rect.name = "player"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func jump(holdTime: Double) {
        if canJump {
            var speed = Int(holdTime * 10000)
            if speed >= 800 {
                speed = 800
            }
            canJump = false
            rect.physicsBody?.velocity = CGVector(dx: 0, dy: speed)
        }
    }
}

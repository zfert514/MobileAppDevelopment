//
//  FallingBall.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/16/21.
//

import SpriteKit

class FallingBall: SKShapeNode {
    
    var canJump = false
    
    let circ = SKShapeNode(circleOfRadius: 20)
    
    override init() {
        super.init()
        
        circ.fillColor = .orange
        circ.strokeColor = .white
        circ.glowWidth = 1.0
        circ.isAntialiased = true
        
        circ.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        circ.physicsBody?.contactTestBitMask = circ.physicsBody?.collisionBitMask ?? 0
        circ.name = "player"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft(holdTime: Double) {
        var speed = -5-(holdTime*5)
        if speed <= -13 {
            speed = -13
        }
        let action = SKAction.move(by: CGVector(dx: speed, dy: 0), duration: 0.25)
        circ.run(action)
    }
    
    func moveRight(holdTime: Double) {
        var speed = 5+(holdTime*5)
        if speed >= 13 {
            speed = 13
        }
        let action = SKAction.move(by: CGVector(dx: speed, dy: 0), duration: 0.25)
        circ.run(action)
    }
}

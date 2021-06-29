//
//  PlayerBall.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/27/21.
//

import SpriteKit

class PlayerBall: SKShapeNode {
    let circ = SKShapeNode(circleOfRadius: 15)
    
    override init() {
        super.init()
        
        circ.fillColor = .yellow
        circ.strokeColor = .black
        circ.glowWidth = 1.0
        circ.isAntialiased = true
        
        circ.physicsBody?.restitution = 1
        circ.physicsBody?.friction = 0
        circ.physicsBody?.allowsRotation = false
        circ.physicsBody?.linearDamping = 0
        circ.physicsBody?.angularDamping = 0
        
        circ.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        circ.physicsBody?.contactTestBitMask = 0b0001
        circ.physicsBody?.collisionBitMask = 0b0001
        circ.name = "player"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft() {
        let move = SKAction.move(by: CGVector(dx: -5, dy: 0), duration: 0.25)
        circ.run(move)
    }
    
    func moveRight() {
        let move = SKAction.move(by: CGVector(dx: 5, dy: 0), duration: 0.25)
        circ.run(move)
    }
}

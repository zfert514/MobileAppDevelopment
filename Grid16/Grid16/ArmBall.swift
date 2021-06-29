//
//  ArmBall.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/27/21.
//

import SpriteKit

class ArmBall: SKShapeNode {
    
    let circ = SKShapeNode(circleOfRadius: 10)
    
    override init() {
        super.init()
        
        circ.fillColor = .green
        circ.strokeColor = .black
        circ.glowWidth = 1.0
        circ.isAntialiased = true
        
        circ.physicsBody?.affectedByGravity = false
        circ.physicsBody?.isDynamic = false
        circ.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        circ.physicsBody?.contactTestBitMask = 0b0001
        circ.physicsBody?.collisionBitMask = 0b0001
        circ.name = "player"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft(pos: SKShapeNode) {
        let changedPos = CGPoint(x: pos.position.x+170, y: pos.position.y)
        if circ.position.x <= changedPos.x {
            let move = SKAction.move(by: CGVector(dx: 3, dy: 0), duration: 0.25)
            circ.run(move)
            circ.position.y = pos.position.y
        } else {
            circ.position = changedPos
        }
    }
    
    func moveRight(pos: SKShapeNode) {
        if circ.position.x >= pos.position.x {
            let move = SKAction.move(by: CGVector(dx: -3, dy: 0), duration: 0.25)
            circ.run(move)
            circ.position.y = pos.position.y
        } else {
            circ.position = pos.position
        }
    }
}

//
//  PongPaddle.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/16/21.
//

import SpriteKit

class PongPaddle: SKShapeNode {
    
    let height = 20
    let width = 150

    let rect = SKShapeNode(rectOf: CGSize(width: 150, height: 20))

    override init() {
        super.init()
        
        rect.fillColor = .orange
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        rect.physicsBody?.contactTestBitMask = rect.physicsBody?.collisionBitMask ?? 0
        rect.physicsBody?.allowsRotation = false
        rect.physicsBody?.isDynamic = false
        rect.physicsBody?.friction = 0
        rect.name = "player"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func moveLeft() {
        let action = SKAction.move(by: CGVector(dx: -10, dy: 0), duration: 0.25)
        rect.run(action)
    }
    
    func moveRight() {
        let action = SKAction.move(by: CGVector(dx: 10, dy: 0), duration: 0.25)
        rect.run(action)
    }
}

//
//  SpinningArm.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/27/21.
//

import SpriteKit

class SpinningArm: SKShapeNode {
    
    let height = 7
    let width = 200
    var baseSpeed = 0.0
    var spinSpeed = 125.0
    
    var oneRevolution = SKAction()
    var action = SKAction()

    let rect = SKShapeNode(rectOf: CGSize(width: 300, height: 10))
    let circ = SKShapeNode(circleOfRadius: 5)
    
    override init() {
        super.init()
        rect.path = CGPath(rect: CGRect(x: -width, y: -5, width: width, height: height), transform: nil)
        
        rect.fillColor = .white
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        rect.physicsBody?.isDynamic = false
        rect.physicsBody?.categoryBitMask = 0b0000
        rect.physicsBody?.friction = 0
        
        rect.name = "arm"
        
        circ.fillColor = .white
        circ.strokeColor = .white
        circ.glowWidth = 1.0
        circ.isAntialiased = true
        
        circ.physicsBody?.affectedByGravity = false
        circ.physicsBody?.isDynamic = false
        circ.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        circ.physicsBody?.contactTestBitMask = 0b0000
        circ.physicsBody?.collisionBitMask = 0b0000
        
        oneRevolution = SKAction.rotate(byAngle: 360, duration: spinSpeed)
        action = SKAction.repeatForever(oneRevolution)
        rect.run(action)
        
        baseSpeed = spinSpeed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeSpeed(worldSpeed: Double) {
        if(baseSpeed/worldSpeed != spinSpeed){
            spinSpeed = 100.0/worldSpeed
            oneRevolution = SKAction.rotate(byAngle: 360, duration: spinSpeed)
            action = SKAction.repeatForever(oneRevolution)
            rect.run(action)
        }
    }
}

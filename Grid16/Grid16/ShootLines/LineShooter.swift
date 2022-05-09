//
//  LineShooter.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/11/21.
//

import SpriteKit

class LineShooter: SKShapeNode {
    
    let radius = 20
    
    let width = 15
    
    let shootTime = 0.2
	
	var facing = "left"
    
    let circ = SKShapeNode(circleOfRadius: CGFloat(20))
    
    override init() {
        super.init()
        
        circ.fillColor = .blue
        circ.strokeColor = .white
        circ.glowWidth = 1.0
        circ.isAntialiased = true
        
        circ.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(20))
        circ.physicsBody?.contactTestBitMask = 0b0001
        circ.physicsBody?.collisionBitMask = 0b0001
        circ.physicsBody?.allowsRotation = false
        circ.name = "player"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeBullet() -> SKShapeNode {
        let box = SKShapeNode(rectOf: CGSize(width: width, height: width))
        box.fillColor = .orange
        box.strokeColor = .white
        box.glowWidth = 1.0
        box.isAntialiased = true
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: width))
        box.physicsBody?.contactTestBitMask = 0b0000
        box.physicsBody?.collisionBitMask = 0b0000
        box.physicsBody?.allowsRotation = false
		
		if facing == "left"{
			box.position = CGPoint(x: circ.position.x-CGFloat(2*radius), y: circ.position.y)
			box.physicsBody?.velocity = CGVector(dx: -300, dy: 0)
		} else {
			box.position = CGPoint(x: circ.position.x+CGFloat(2*radius), y: circ.position.y)
			box.physicsBody?.velocity = CGVector(dx: 300, dy: 0)
		}
		
        box.name = "bullet"
        
        return box
    }
    
    func moveUp() {
        let action = SKAction.move(by: CGVector(dx: 0, dy: 10), duration: 0.25)
        circ.run(action)
    }
    
    func moveDown() {
        let action = SKAction.move(by: CGVector(dx: 0, dy: -10), duration: 0.25)
        circ.run(action)
    }
	
	func turnLeft() {
		facing = "left"
	}
	
	func turnRight() {
		facing = "right"
	}
}

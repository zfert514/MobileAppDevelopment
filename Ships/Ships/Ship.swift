//
//  Ship.swift
//  Ships
//
//  Created by Zachary Fertig on 4/12/21.
//

import SpriteKit

class Ship: SKShapeNode {
    
    let r = 10.0
    let sp = 125.0
    
    override init() {
        super.init()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: r * 2.0))
        path.addLine(to: CGPoint(x: -r, y: -r * 2.0))
        path.addLine(to: CGPoint(x: r, y: -r * 2.0))
        path.addLine(to: CGPoint(x: 0.0, y: r * 2.0))
        self.path = path.cgPath
        
        self.fillColor = .orange
        self.strokeColor = .white
        self.glowWidth = 1.0
        self.isAntialiased = true
        
        self.physicsBody = SKPhysicsBody(polygonFrom: path.cgPath)
        self.physicsBody?.collisionBitMask = 0b0000
        self.physicsBody?.contactTestBitMask = 0b0001
        self.name = "ship"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(screen: CGRect) {
        //steer the ship in the direction it is pointing
        let theta = Double(zRotation + CGFloat.pi/2.0)
        let dx = CGFloat(sp * cos(theta))
        let dy = CGFloat(sp * sin(theta))
        self.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
        
        //teleport if needed
        if self.position.x - CGFloat(r * 2.0) > screen.maxX {
            let action = SKAction.moveTo(x: CGFloat(-r * 2.0), duration: 0.0)
            self.run(action)
        }
        if self.position.x + CGFloat(r * 2.0) < screen.minX {
            let action = SKAction.moveTo(x: CGFloat(screen.maxX + CGFloat(r * 2.0)), duration: 0.0)
            self.run(action)
        }
        if self.position.y - CGFloat(r * 2.0) > screen.maxY {
            let action = SKAction.moveTo(y: CGFloat(-r * 2.0), duration: 0.0)
            self.run(action)
        }
        if self.position.y + CGFloat(r * 2.0) < screen.minY {
            let action = SKAction.moveTo(y: CGFloat(screen.maxY + CGFloat(r * 2.0)), duration: 0.0)
            self.run(action)
        }
    }
    
    func turnLeft() {
        let action = SKAction.rotate(byAngle: CGFloat(CGFloat.pi/80.0), duration: 0.25)
        self.run(action)
    }
    
    func turnRight() {
        let action = SKAction.rotate(byAngle: -CGFloat(CGFloat.pi/80.0), duration: 0.25)
        self.run(action)
    }
    
}

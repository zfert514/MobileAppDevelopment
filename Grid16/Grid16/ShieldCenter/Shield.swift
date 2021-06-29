//
//  Shield.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/9/21.
//

import SpriteKit

class Shield: SKShapeNode {
    
    let height = 60
    let width = 50

    let rect = SKShapeNode(rectOf: CGSize(width: 50, height: 60))

    override init() {
        super.init()
        //rect.path = CGPath(rect: CGRect(x: -width*2, y: -height/2, width: width, height: height), transform: nil)
        
        //rect.path = CGPath(ellipseIn: CGRect(x: -width*2, y: -height/2, width: width, height: height), transform: nil)
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: 0,y: -60), radius: CGFloat(35), startAngle: CGFloat(CGFloat.pi), endAngle: CGFloat(2*CGFloat.pi), clockwise: true)
        rect.path = path.cgPath
        
        rect.fillColor = .blue
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(35), center: CGPoint(x: 0, y: -60))
        rect.physicsBody?.contactTestBitMask = 0b0001
        rect.physicsBody?.collisionBitMask = 0b0001
        rect.physicsBody?.allowsRotation = false
        rect.physicsBody?.isDynamic = false
        rect.physicsBody?.friction = 0
        rect.name = "player"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func moveLeft() {
        let action = SKAction.rotate(byAngle: CGFloat(-0.1), duration: 0.25)
        rect.run(action)
    }
    
    func moveRight() {
        let action = SKAction.rotate(byAngle: CGFloat(0.1), duration: 0.25)
        rect.run(action)
    }
}


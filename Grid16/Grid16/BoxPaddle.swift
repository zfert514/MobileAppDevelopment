//
//  BoxPaddle.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/8/21.
//

import SpriteKit

class BoxPaddle: SKShapeNode {
    
    let height = 10
    let width = 300

    let rect = SKShapeNode(rectOf: CGSize(width: 300, height: 10))

    override init() {
        super.init()
        
        rect.fillColor = .green
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true

        rect.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
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

    func moveLeft(frame: CGRect) {
        rect.zRotation = CGFloat(CGFloat.pi/2.0)
        rect.position = CGPoint(x: frame.midX-CGFloat(width/2), y: frame.midY)
    }
    
    func moveRight(frame: CGRect) {
        rect.zRotation = CGFloat(CGFloat.pi/2.0)
        rect.position = CGPoint(x: frame.midX+CGFloat(width/2), y: frame.midY)
    }
    
    func moveUp(frame: CGRect) {
        rect.zRotation = CGFloat(0)
        rect.position = CGPoint(x: frame.midX, y: frame.midY+CGFloat(width/2))
    }
    
    func moveDown(frame: CGRect) {
        rect.zRotation = CGFloat(0)
        rect.position = CGPoint(x: frame.midX, y: frame.midY-CGFloat(width/2))
    }
}

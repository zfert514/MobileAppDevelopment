//
//  PlayerArrow.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/9/21.
//

import SpriteKit

class PlayerArrow: SKShapeNode {
    
    let height = 120
    let width = 10
    
    let arrowSize = 50
    
    var canJump = false
    
    let rect = SKShapeNode(rectOf: CGSize(width: 10, height: 120))
    var arrow = SKSpriteNode()
    
    override init() {
        super.init()
        
        rect.fillColor = .clear
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width, height: height))
        rect.physicsBody?.contactTestBitMask = 0b0001
        rect.physicsBody?.collisionBitMask = 0b0001
        rect.physicsBody?.isDynamic = false
        rect.physicsBody?.allowsRotation = false
        rect.name = "player"
        
        let image = UIImage(named: "BoxArrow")
        let texture = SKTexture(image: image!)
        arrow = SKSpriteNode(texture: texture)
        arrow.scale(to: CGSize(width: CGFloat(arrowSize), height: CGFloat(arrowSize)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveLeft(frame: CGRect) {
        arrow.zRotation = CGFloat(CGFloat.pi/2.0)
    }
    
    func moveRight(frame: CGRect) {
        arrow.zRotation = CGFloat(3*CGFloat.pi/2.0)
    }
    
    func moveUp(frame: CGRect) {
        arrow.zRotation = CGFloat(0)
    }
    
    func moveDown(frame: CGRect) {
        arrow.zRotation = CGFloat(CGFloat.pi)
    }
}

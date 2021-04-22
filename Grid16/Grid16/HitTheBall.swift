//
//  HitTheBall.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/16/21.
//

import SpriteKit

class HitTheBall: GameBase {
    
    var pp = PongPaddle()
    
    var gameLabel = SKLabelNode(text: "Hit The Ball")
    
    var currentTouches = Set<UITouch>()
    
    override func didMove(to view: SKView) {
        // enable the FPS label
        view.showsFPS = true
        let player = pp.rect
        
        self.backgroundColor = .blue
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.friction = 0
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
        addChild(gameLabel)
        
        player.position = CGPoint(x: frame.midX, y: frame.minY + 60)
        addChild(player)
        
        makeGround()
    }
    
    func makeGround() {
        
        let ground = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ground.fillColor = .blue
        ground.strokeColor = .blue
        ground.glowWidth = 1.0
        
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.contactTestBitMask = 0b0000
        ground.physicsBody?.collisionBitMask = 0b0001
        ground.physicsBody?.friction = 0
        ground.alpha = 0.0
        ground.name = "ground"
        
        ground.position = CGPoint(x: frame.midX, y: frame.minY)
        addChild(ground)
        
        makeBall()
    }
    
    func makeOverlay() {
        let over = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: frame.maxY))
        over.fillColor = .gray
        over.strokeColor = .gray
        over.glowWidth = 1.0
        over.alpha = 0.7
        
        over.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(over)
    }
    
    func makeBall() {
        let ball = SKShapeNode(circleOfRadius: 20)
        ball.fillColor = .green
        ball.strokeColor = .white
        ball.position.x = frame.midX
        ball.position.y = frame.maxY
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.friction = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        
        ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
        ball.name = "ball"
        
        ball.physicsBody?.velocity = CGVector(dx: Double.random(in: -500...500), dy: -400)
        
        addChild(ball)
    }
    
    func lose() {
        let loseLabel = SKLabelNode(text: "Failed")
        loseLabel.fontSize = 100
        loseLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(loseLabel)
        makeOverlay()
        lost = true
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ball" && nodeB.name == "ground" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "ground" && nodeB.name == "ball" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.insert(touch)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.remove(touch)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lost { return }
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).x < frame.midX {
                pp.moveLeft()
                if pp.rect.position.x < frame.minX {
                    pp.rect.position.x = frame.minX
                }
            } else {
                pp.moveRight()
                if pp.rect.position.x > frame.maxX {
                    pp.rect.position.x = frame.maxX
                }
            }
        }
    }
}

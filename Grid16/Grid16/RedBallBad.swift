//
//  RedBallBad.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/27/21.
//

import SpriteKit

class RedBallBad: GameBase {
    
    var started = false
    
    var sa = SpinningArm()
    var ab = ArmBall()
    
    let ball = SKShapeNode(circleOfRadius: 15)
    
    var currentTouches = Set<UITouch>()
    
    var gameLabel = SKLabelNode(text: "Red Ball Bad")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let arm = sa.rect
            let cap = sa.circ
            let player = ab.circ
            
            self.backgroundColor = .gray
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            self.physicsWorld.speed = CGFloat(worldSpeed)
            physicsWorld.gravity = .zero
            //self.paused
            
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX-CGFloat(sa.width-10), y: frame.midY)
            addChild(player)
            
            cap.position = CGPoint(x: frame.midX-CGFloat(sa.width), y: frame.midY-CGFloat(sa.height/4))
            addChild(cap)
            
            arm.position = CGPoint(x: frame.midX, y: frame.midY)
            
            cap.move(toParent: arm)
            player.move(toParent: arm)
            
            addChild(arm)
            
            makeBall()
            makeCenter()
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
        currentTouches.removeAll()
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
        let enemy = SKShapeNode(circleOfRadius: 20)
        enemy.fillColor = .red
        enemy.strokeColor = .black
        enemy.position.x = frame.midX
        enemy.position.y = frame.minY
        
        enemy.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        
        enemy.physicsBody?.restitution = 1
        enemy.physicsBody?.friction = 0
        enemy.physicsBody?.allowsRotation = false
        enemy.physicsBody?.linearDamping = 0
        enemy.physicsBody?.angularDamping = 0
    
        enemy.physicsBody?.contactTestBitMask = 0b0001
        enemy.physicsBody?.collisionBitMask = 0b0001
        enemy.name = "enemy"
        
        enemy.physicsBody?.velocity = CGVector(dx: 0, dy: 300)
        
        addChild(enemy)
    }
    
    func makeCenter() {
        ball.fillColor = .gray
        ball.strokeColor = .white
        ball.position.x = frame.midX
        ball.position.y = frame.midY
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.isDynamic = false
        ball.physicsBody?.contactTestBitMask = 0b0001
        ball.physicsBody?.collisionBitMask = 0b0001
        ball.name = "center"
        
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
        
        if nodeA.name == "enemy" && nodeB.name == "player" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "player" && nodeB.name == "enemy" {
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
        
        //sa.changeSpeed(worldSpeed: worldSpeed)
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).x < frame.midX {
                ab.moveLeft(pos: sa.circ)
            } else {
                ab.moveRight(pos: sa.circ)
            }
        }
    }
}

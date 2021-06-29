//
//  KeepJumping.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/15/21.
//

import SpriteKit

class KeepJumping: GameBase {
    
    var started = false
    
    var js = JumpingStick()
    
    var holdTime = 0.0
    var ballTime = 0.0
    var spawnTime = 1.0
    
    var touched = false
    var lifted  = false
    
    var gameLabel = SKLabelNode(text: "Keep Jumping")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = js.rect
            
            //physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            //self.physicsWorld.speed = 0 for paused and more than 1 for fast
            //self.paused
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            makeGround()
            started = true
        }
    }
    
    func makeGround() {
        let ground = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ground.fillColor = .white
        ground.strokeColor = .white
        ground.glowWidth = 1.0
        
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.contactTestBitMask = ground.physicsBody?.collisionBitMask ?? 0
        ground.name = "ground"
        
        ground.position = CGPoint(x: frame.midX, y: frame.midY - CGFloat(js.height))
        addChild(ground)
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
        ball.fillColor = .red
        ball.strokeColor = .white
        ball.position.x = frame.minX
        ball.position.y = frame.midY
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        //ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
        ball.name = "ball"
        
        ball.physicsBody?.velocity = CGVector(dx: 500, dy: 0)
        
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
        
        if nodeA.name == "ground" && nodeB.name == "player" {
            js.canJump = true
        } else if nodeA.name == "player" && nodeB.name == "ground" {
            js.canJump = true
        }
        
        if nodeA.name == "ball" && nodeB.name == "player" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "player" && nodeB.name == "ball" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            touched = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            lifted = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lost { return }
        
        if touched {
            holdTime = currentTime
            touched = false
        }
        if lifted {
            js.jump(holdTime: currentTime - holdTime)
            lifted = false
        }
        
        //add balls every 4 seconds
        if (ballTime == 0.0) {
            ballTime = currentTime
        } else if (ballTime != 0.0 && ballTime + spawnTime/Double(self.physicsWorld.speed) < currentTime) {
            makeBall()
            ballTime = currentTime
            spawnTime = Double.random(in: 1...4)
        }
    }
}

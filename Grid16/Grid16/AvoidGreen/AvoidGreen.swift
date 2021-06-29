//
//  AvoidGreen.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/27/21.
//

import SpriteKit

class AvoidGreen: GameBase {
    
    var started = false
    
    var pb = PlayerBall()
    
    let ball = SKShapeNode(circleOfRadius: 15)
    let numEnemies = 3
    
    var currentTouches = Set<UITouch>()
    
    var gameLabel = SKLabelNode(text: "AvoidGreen")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = pb.circ
            
            self.backgroundColor = .systemPink
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            self.physicsWorld.speed = CGFloat(worldSpeed)
            //physicsWorld.gravity = .zero
            //self.paused
            
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            makeBalls()
            makeWalls()
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
    
    func makeBalls() {
        for _ in 1...numEnemies {
            let enemy = SKShapeNode(circleOfRadius: 20)
            enemy.fillColor = .green
            enemy.strokeColor = .black
            if Int.random(in: 0...1) == 0 {
                enemy.position.x = CGFloat.random(in: frame.minX+10...frame.midX/2)
            } else {
                enemy.position.x = CGFloat.random(in: frame.maxX-frame.midX/2...frame.maxX-10)
            }
            enemy.position.y = CGFloat.random(in: frame.minY+10...frame.maxY-10)
            
            enemy.physicsBody = SKPhysicsBody(circleOfRadius: 20)
            
            enemy.physicsBody?.restitution = 1
            enemy.physicsBody?.friction = 0
            enemy.physicsBody?.allowsRotation = false
            enemy.physicsBody?.linearDamping = 0
            enemy.physicsBody?.angularDamping = 0
            
            enemy.physicsBody?.contactTestBitMask = 0b0001
            enemy.physicsBody?.collisionBitMask = 0b0001
            enemy.name = "enemy"
            
            enemy.physicsBody?.velocity = CGVector(dx: Double.random(in: -200...200), dy: 0)
            
            addChild(enemy)
        }
    }
    
    func makeWalls() {
        
        let ground = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ground.fillColor = .blue
        ground.strokeColor = .blue
        ground.glowWidth = 1.0
        
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.contactTestBitMask = 0b0001
        ground.physicsBody?.collisionBitMask = 0b0001
        ground.physicsBody?.friction = 0
        ground.alpha = 0.0
        ground.name = "ground"
        
        ground.position = CGPoint(x: frame.midX, y: frame.minY)
        addChild(ground)
        
        let left = SKShapeNode(rectOf: CGSize(width: 5, height: frame.maxY))
        left.fillColor = .blue
        left.strokeColor = .blue
        left.glowWidth = 1.0
        
        left.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: frame.maxY))
        left.physicsBody?.isDynamic = false
        left.physicsBody?.contactTestBitMask = 0b0001
        left.physicsBody?.collisionBitMask = 0b0001
        left.physicsBody?.friction = 0
        left.alpha = 0.0
        left.name = "left"
        
        left.position = CGPoint(x: frame.minX, y: frame.midY)
        addChild(left)
        
        let right = SKShapeNode(rectOf: CGSize(width: 5, height: frame.maxY))
        right.fillColor = .blue
        right.strokeColor = .blue
        right.glowWidth = 1.0
        
        right.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: frame.maxY))
        right.physicsBody?.isDynamic = false
        right.physicsBody?.contactTestBitMask = 0b0001
        right.physicsBody?.collisionBitMask = 0b0001
        right.physicsBody?.friction = 0
        right.alpha = 0.0
        right.name = "right"
        
        right.position = CGPoint(x: frame.maxX, y: frame.midY)
        addChild(right)
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
        
        if nodeA.name == "ground" && nodeB.name == "player" {
            nodeB.physicsBody?.velocity = CGVector(dx: 0, dy: 1000)
        } else if nodeA.name == "player" && nodeB.name == "ground" {
            nodeA.physicsBody?.velocity = CGVector(dx: 0, dy: 1000)
        }
        
        if nodeA.name == "left" && nodeB.name == "player" {
            nodeB.physicsBody?.velocity = CGVector(dx: 400, dy: 0)
        } else if nodeA.name == "player" && nodeB.name == "left" {
            nodeA.physicsBody?.velocity = CGVector(dx: 400, dy: 0)
        }
        
        if nodeA.name == "right" && nodeB.name == "player" {
            nodeB.physicsBody?.velocity = CGVector(dx: -400, dy: 0)
        } else if nodeA.name == "player" && nodeB.name == "right" {
            nodeA.physicsBody?.velocity = CGVector(dx: -400, dy: 0)
        }
        
        if nodeA.name == "ground" && nodeB.name == "enemy" {
            nodeB.physicsBody?.velocity = CGVector(dx: (nodeB.physicsBody?.velocity.dx)!, dy: 1000)
        } else if nodeA.name == "enemy" && nodeB.name == "ground" {
            nodeA.physicsBody?.velocity = CGVector(dx: (nodeA.physicsBody?.velocity.dx)!, dy: 1000)
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
                pb.moveLeft()
            } else {
                pb.moveRight()
            }
        }
    }
}

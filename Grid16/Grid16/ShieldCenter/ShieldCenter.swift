//
//  ShieldCenter.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/9/21.
//

import SpriteKit

class ShieldCenter: GameBase {
    
    var started = false
    
    var s = Shield()
    
    var enemyTime = 0.0
    var spawnTime = 1.5
    
    var gameLabel = SKLabelNode(text: "Shield Center")
    
    var currentTouches = Set<UITouch>()
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = s.rect
            
            self.backgroundColor = .systemTeal
            physicsBody?.friction = 0
            physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            makeCenter()
            
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
        currentTouches.removeAll()
    }
    
    func makeCenter() {
        let ball = SKShapeNode(circleOfRadius: 40)
        ball.fillColor = .gray
        ball.strokeColor = .white
        ball.position.x = frame.midX
        ball.position.y = frame.midY
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        ball.physicsBody?.isDynamic = false
        ball.physicsBody?.contactTestBitMask = 0b0001
        ball.physicsBody?.collisionBitMask = 0b0001
        ball.name = "center"
        
        addChild(ball)
        
        let inner = SKShapeNode(circleOfRadius: 60)
        inner.fillColor = .clear
        inner.strokeColor = .white
        inner.position.x = frame.midX
        inner.position.y = frame.midY
        inner.physicsBody?.isDynamic = false
        inner.physicsBody?.contactTestBitMask = 0b0000
        inner.physicsBody?.collisionBitMask = 0b0000
        addChild(inner)
        
        let outer = SKShapeNode(circleOfRadius: 95)
        outer.fillColor = .clear
        outer.strokeColor = .white
        outer.position.x = frame.midX
        outer.position.y = frame.midY
        outer.physicsBody?.isDynamic = false
        outer.physicsBody?.contactTestBitMask = 0b0000
        outer.physicsBody?.collisionBitMask = 0b0000
        addChild(outer)
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
    
    func makeEnemy() {
        let box = SKShapeNode(rectOf: CGSize(width: 25, height: 25))
        box.fillColor = .red
        box.strokeColor = .white
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 25, height: 25))
        box.physicsBody?.affectedByGravity = false
        box.physicsBody?.contactTestBitMask = 0b0001
        box.physicsBody?.collisionBitMask = 0b0001
        box.name = "enemy"
        
        let num = Int.random(in: 0...3)
        
        if num == 0 {
            box.position.x = frame.minX
            box.position.y = frame.midY
            box.physicsBody?.velocity = CGVector(dx: 300, dy: 0)
        }
        if num == 1 {
            box.position.x = frame.maxX
            box.position.y = frame.midY
            box.physicsBody?.velocity = CGVector(dx: -300, dy: 0)
        }
        if num == 2 {
            box.position.x = frame.midX
            box.position.y = frame.minY
            box.physicsBody?.velocity = CGVector(dx: 0, dy: 300)
        }
        if num == 3 {
            box.position.x = frame.midX
            box.position.y = frame.maxY
            box.physicsBody?.velocity = CGVector(dx: 0, dy: -300)
        }
        
        addChild(box)
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
        
        if nodeA.name == "enemy" && nodeB.name == "center" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "center" && nodeB.name == "enemy" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
        
        if nodeA.name == "enemy" && nodeB.name == "player" {
            nodeA.removeFromParent()
        } else if nodeA.name == "player" && nodeB.name == "enemy" {
            nodeB.removeFromParent()
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
                s.moveLeft()
                if s.rect.position.x < frame.minX {
                    s.rect.position.x = frame.minX
                }
            } else {
                s.moveRight()
                if s.rect.position.x > frame.maxX {
                    s.rect.position.x = frame.maxX
                }
            }
        }
        
        //add enemies
        if (enemyTime == 0.0) {
            enemyTime = currentTime
        } else if (enemyTime != 0.0 && enemyTime + spawnTime/Double(self.physicsWorld.speed) < currentTime) {
            makeEnemy()
            enemyTime = currentTime
            spawnTime = Double.random(in: 1...4)
        }
    }
}


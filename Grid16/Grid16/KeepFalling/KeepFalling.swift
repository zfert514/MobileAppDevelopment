//
//  KeepFalling.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/16/21.
//

import SpriteKit

class KeepFalling: GameBase {
    
    var started = false
    
    var fb = FallingBall()
    
    var platTime = 0.0
    var holdTime = 0.0
    var spawnTime = 1.0
    
    var touched = false
    var lifted = false
    
    var currentTouches = Set<UITouch>()
    var platforms = [SKShapeNode]()
    
    var gameLabel = SKLabelNode(text: "Keep Falling")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = fb.circ
            
            self.backgroundColor = .purple
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            self.physicsWorld.speed = CGFloat(worldSpeed)
            //self.paused
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            makeCeil()
            makePlatforms()
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
        currentTouches.removeAll()
    }
    
    func makeCeil() {
        let ceil = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ceil.fillColor = .white
        ceil.strokeColor = .white
        ceil.glowWidth = 1.0
        
        ceil.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ceil.physicsBody?.isDynamic = false
        ceil.physicsBody?.contactTestBitMask = ceil.physicsBody?.collisionBitMask ?? 0
        ceil.name = "ceil"
        
        ceil.position = CGPoint(x: frame.midX, y: frame.maxY)
        addChild(ceil)
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
    
    func makePlatforms() {
        let lWidth = frame.maxX - CGFloat.random(in: 200...frame.maxX)
        
        let left = SKShapeNode(rectOf: CGSize(width: lWidth, height: 20))
        left.fillColor = .brown
        left.strokeColor = .black
        left.position.x = frame.minX + 1
        left.position.y = frame.minY + 1
        
        left.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: lWidth, height: 20))
        left.physicsBody?.affectedByGravity = false
        left.physicsBody?.allowsRotation = false
        left.physicsBody?.contactTestBitMask = left.physicsBody?.collisionBitMask ?? 0
        left.name = "platform"
        
        addChild(left)
        platforms.append(left)
        
        let rWidth = frame.maxX-lWidth - 200
        
        let right = SKShapeNode(rectOf: CGSize(width: rWidth, height: 20))
        right.fillColor = .brown
        right.strokeColor = .black
        right.position.x = frame.maxX - 1
        right.position.y = frame.minY + 1
        
        right.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rWidth, height: 20))
        right.physicsBody?.affectedByGravity = false
        right.physicsBody?.allowsRotation = false
        right.physicsBody?.contactTestBitMask = right.physicsBody?.collisionBitMask ?? 0
        right.name = "platform"
        
        addChild(right)
        platforms.append(right)
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
        
        if nodeA.name == "ceil" && nodeB.name == "player" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "player" && nodeB.name == "ceil" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
        
        if nodeA.name == "ceil" && nodeB.name == "platform" {
            nodeB.removeFromParent()
        } else if nodeA.name == "platform" && nodeB.name == "ceil" {
            nodeA.removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.insert(touch)
            touched = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.remove(touch)
            lifted = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lost { return }
        
        //platform velocity
        for platform in platforms {
            platform.physicsBody?.velocity = CGVector(dx: 0, dy: 150)
        }
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).x < frame.midX {
                fb.moveLeft(holdTime: currentTime - holdTime)
                if fb.circ.position.x < frame.minX {
                    fb.circ.position.x = frame.minX
                }
            } else {
                fb.moveRight(holdTime: currentTime - holdTime)
                if fb.circ.position.x > frame.maxX {
                    fb.circ.position.x = frame.maxX
                }
            }
        }
        
        if touched {
            holdTime = currentTime
            touched = false
        }
        if lifted {
            lifted = false
        }
        
        //add platforms every second
        if (platTime == 0.0) {
            platTime = currentTime
        } else if (platTime != 0.0 && platTime + spawnTime/worldSpeed < currentTime) {
            makePlatforms()
            platTime = currentTime
            //spawnTime = Double.random(in: 1...4)
        }
    }
}


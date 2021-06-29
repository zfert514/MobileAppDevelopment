//
//  ShootLines.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/11/21.
//

import SpriteKit

class ShootLines: GameBase {
    
    var started = false
    
    var pbs = PlayerBoxShooter()
    
    var currentTouches = Set<UITouch>()
    
    var boxTime = 0.0
    var spawnTime = 1.0
    var bulletTime = 0.0
    
    let boxWidth = 100
    
    var gameLabel = SKLabelNode(text: "Don't Shoot Boxes")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = pbs.circ
            
            self.backgroundColor = .cyan
            //physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            //self.physicsWorld.speed = 0 for paused and more than 1 for fast
            //self.paused
            self.physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.minY + CGFloat(2*pbs.radius))
            addChild(player)
            
            //makeGround()
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
        currentTouches.removeAll()
    }
    
    func makeGround() {
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
    
    func makeBox() -> SKShapeNode{
        let box = SKShapeNode(rectOf: CGSize(width: boxWidth, height: boxWidth))
        box.fillColor = .red
        box.strokeColor = .white
        box.position.x = CGFloat.random(in: frame.minX+CGFloat(boxWidth/2)...frame.maxX-CGFloat(boxWidth/2))
        box.position.y = frame.maxY
        
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxWidth))
        //box.physicsBody?.affectedByGravity = false
        box.physicsBody?.contactTestBitMask = box.physicsBody?.collisionBitMask ?? 0
        box.name = "box"
        
        box.physicsBody?.velocity = CGVector(dx: 0, dy: -300)
        
        return box
    }
    
    func split(boxOG: SKShapeNode) {
        let box1 = makeBox()
        let box2 = makeBox()
        box1.position = CGPoint(x: boxOG.position.x-CGFloat(boxWidth/2), y: boxOG.position.y)
        box2.position = CGPoint(x: boxOG.position.x+CGFloat(boxWidth/2), y: boxOG.position.y)
        box1.setScale(0.5*boxOG.xScale)
        box2.setScale(0.5*boxOG.xScale)
        addChild(box1)
        addChild(box2)
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
        
        if nodeA.name == "box" && nodeB.name == "player" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "player" && nodeB.name == "box" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
        
        if nodeA.name == "box" && nodeB.name == "bullet" {
            split(boxOG: nodeA as! SKShapeNode)
            nodeB.removeFromParent()
            nodeA.removeFromParent()
        } else if nodeA.name == "bullet" && nodeB.name == "box" {
            split(boxOG: nodeB as! SKShapeNode)
            nodeB.removeFromParent()
            nodeA.removeFromParent()
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
        
        if pbs.circ.position.x < frame.minX+CGFloat(2*pbs.radius) {
            pbs.circ.position.x = frame.minX+CGFloat(2*pbs.radius)
        }
        if pbs.circ.position.x > frame.maxX-CGFloat(2*pbs.radius) {
            pbs.circ.position.x = frame.maxX-CGFloat(2*pbs.radius)
        }
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).x < frame.midX {
                pbs.moveLeft()
            } else {
                pbs.moveRight()
            }
        }
        
        //add boxes
        if (boxTime == 0.0) {
            boxTime = currentTime
        } else if (boxTime != 0.0 && boxTime + spawnTime/Double(self.physicsWorld.speed) < currentTime) {
            addChild(makeBox())
            boxTime = currentTime
            spawnTime = Double.random(in: 1...1)
        }
        
        //shoot
        if (bulletTime == 0.0) {
            bulletTime = currentTime
        } else if (bulletTime != 0.0 && bulletTime + pbs.shootTime <= currentTime) {
            print("shoot")
            addChild(pbs.makeBullet())
            bulletTime = currentTime
        }
    }
}



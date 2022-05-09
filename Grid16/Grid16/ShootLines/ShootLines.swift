//
//  ShootLines.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/11/21.
//

import SpriteKit

class ShootLines: GameBase {
    
    var started = false
    
    var ls = LineShooter()
    
    var currentTouches = Set<UITouch>()
    
    var boxTime = 0.0
    var spawnTime = 1.0
    var bulletTime = 0.0
    
    let lineHeight = 10
    
    var gameLabel = SKLabelNode(text: "Shoot Lines")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = ls.circ
            
            self.backgroundColor = .cyan
            //physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            //self.physicsWorld.speed = 0 for paused and more than 1 for fast
            //self.paused
            self.physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            makeMiddle()
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
        currentTouches.removeAll()
    }
    
    func makeMiddle() {
        let middle = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        middle.fillColor = .blue
        middle.strokeColor = .blue
        middle.glowWidth = 1.0
        
		middle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: frame.maxY))
        middle.physicsBody?.isDynamic = false
        middle.physicsBody?.contactTestBitMask = 0b0001
        middle.physicsBody?.collisionBitMask = 0b0001
        middle.physicsBody?.friction = 0
        middle.name = "middle"
        
        middle.position = CGPoint(x: frame.midX, y: frame.minY)
        addChild(middle)
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
    
    func makeLine() -> SKShapeNode{
        let line = SKShapeNode(rectOf: CGSize(width: lineHeight, height: lineHeight))
        line.fillColor = .red
        line.strokeColor = .white
        
        line.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: lineHeight, height: lineHeight))
        //box.physicsBody?.affectedByGravity = false
        line.physicsBody?.contactTestBitMask = line.physicsBody?.collisionBitMask ?? 0
        line.name = "line"
        
		let left = 0
		
		if Int.random(in: 0...1) == left {
			line.position.x = frame.minX
			line.physicsBody?.velocity = CGVector(dx: 300, dy: 0)
		} else {
			line.position.x = frame.maxX
			line.physicsBody?.velocity = CGVector(dx: -300, dy: 0)
		}
		
		line.position.y = CGFloat.random(in: frame.minY+CGFloat(lineHeight/2)...frame.maxY-CGFloat(lineHeight/2))
        
        return line
    }
    
    func shorten(boxOG: SKShapeNode) {
        let box1 = makeLine()
        let box2 = makeLine()
        box1.position = CGPoint(x: boxOG.position.x-CGFloat(lineHeight/2), y: boxOG.position.y)
        box2.position = CGPoint(x: boxOG.position.x+CGFloat(lineHeight/2), y: boxOG.position.y)
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
        
        if nodeA.name == "line" && nodeB.name == "middle" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "middle" && nodeB.name == "line" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
        
        if nodeA.name == "line" && nodeB.name == "bullet" {
            shorten(boxOG: nodeA as! SKShapeNode)
            nodeB.removeFromParent()
            nodeA.removeFromParent()
        } else if nodeA.name == "bullet" && nodeB.name == "line" {
            shorten(boxOG: nodeB as! SKShapeNode)
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
        
        if ls.circ.position.y < frame.minY+CGFloat(2*ls.radius) {
            ls.circ.position.y = frame.minY+CGFloat(2*ls.radius)
        }
        if ls.circ.position.y > frame.maxY-CGFloat(2*ls.radius) {
            ls.circ.position.y = frame.maxY-CGFloat(2*ls.radius)
        }
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).y < frame.midY {
                ls.moveDown()
            } else {
                ls.moveUp()
            }
        }
		for touch in currentTouches {
			if touch.location(in: self).x < frame.midX {
				ls.turnLeft()
			} else {
				ls.turnRight()
			}
		}
        
        //add boxes
        if (boxTime == 0.0) {
            boxTime = currentTime
        } else if (boxTime != 0.0 && boxTime + spawnTime/Double(self.physicsWorld.speed) < currentTime) {
            addChild(makeLine())
            boxTime = currentTime
            spawnTime = Double.random(in: 1...1)
        }
        
        //shoot
        if (bulletTime == 0.0) {
            bulletTime = currentTime
        } else if (bulletTime != 0.0 && bulletTime + ls.shootTime <= currentTime) {
            addChild(ls.makeBullet())
            bulletTime = currentTime
        }
    }
}



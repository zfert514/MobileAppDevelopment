//
//  MatchArrows.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/9/21.
//

import SpriteKit

class MatchArrows: GameBase {
    
    var started = false
    
    var pa = PlayerArrow()
    
    var enemyTime = 0.0
    var spawnTime = 1.0
    
    var rotation = CGFloat(0.0)
    
    var gameLabel = SKLabelNode(text: "Match Arrows")
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = pa.rect
            let arrow = pa.arrow
            
            //physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            //self.physicsWorld.speed = 0 for paused and more than 1 for fast
            //self.paused
            self.backgroundColor = .red
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY)
            addChild(player)
            
            arrow.position = CGPoint(x: frame.midX+CGFloat(Double(pa.arrowSize)/1.5), y: frame.midY)
            addChild(arrow)
            
            makeGround()
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
            swipeRight.direction = UISwipeGestureRecognizer.Direction.right
            self.view!.addGestureRecognizer(swipeRight)
            
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
            swipeDown.direction = UISwipeGestureRecognizer.Direction.down
            self.view!.addGestureRecognizer(swipeDown)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
            swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
            self.view!.addGestureRecognizer(swipeLeft)
            
            let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
            swipeUp.direction = UISwipeGestureRecognizer.Direction.up
            self.view!.addGestureRecognizer(swipeUp)
            
            started = true
        }
        print("Scene Speed: ", self.physicsWorld.speed)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                pa.moveRight(frame: frame)
            case UISwipeGestureRecognizer.Direction.down:
                pa.moveDown(frame: frame)
            case UISwipeGestureRecognizer.Direction.left:
                pa.moveLeft(frame: frame)
            case UISwipeGestureRecognizer.Direction.up:
                pa.moveUp(frame: frame)
            default:
                break
            }
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
        
        ground.position = CGPoint(x: frame.midX, y: frame.midY/1.5)
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
    
    func makeArrow() {
        var match = SKSpriteNode()
        let image = UIImage(named: "BoxArrow")
        let texture = SKTexture(image: image!)
        match = SKSpriteNode(texture: texture)
        match.scale(to: CGSize(width: CGFloat(pa.arrowSize), height: CGFloat(pa.arrowSize)))
        match.color = .black
        match.colorBlendFactor = 1.0
        match.position.x = frame.minX
        match.position.y = frame.midY
        
        match.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: CGFloat(pa.arrowSize), height: CGFloat(pa.arrowSize)))
        //match.physicsBody?.affectedByGravity = false
        
        match.physicsBody?.restitution = 0.3
        match.physicsBody?.friction = 0
        match.physicsBody?.allowsRotation = false
        match.physicsBody?.linearDamping = 0
        match.physicsBody?.angularDamping = 0
        
        match.physicsBody?.contactTestBitMask = 0b0001
        match.physicsBody?.collisionBitMask = 0b0001
        match.name = "match"
        
        match.physicsBody?.velocity = CGVector(dx: 400, dy: 0)
        
        let num = Int.random(in: 0...3)
        
        if num == 0 {
            match.zRotation = CGFloat(0.0)
        }
        if num == 1 {
            match.zRotation = CGFloat(CGFloat.pi/2.0)
        }
        if num == 2 {
            match.zRotation = CGFloat(3*CGFloat.pi/2.0)
        }
        if num == 3 {
            match.zRotation = CGFloat(CGFloat.pi)
        }
        rotation = match.zRotation
        
        addChild(match)
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
        
        if nodeA.name == "match" && nodeB.name == "player" {
            if rotation != pa.arrow.zRotation {
                print(nodeA.zRotation, pa.arrow.zRotation)
                nodeA.physicsBody?.isDynamic = false
                nodeB.physicsBody?.isDynamic = false
                lose()
            } else {
                nodeA.removeFromParent()
            }
        } else if nodeA.name == "player" && nodeB.name == "match" {
            if rotation != pa.arrow.zRotation {
                print(nodeA.zRotation, pa.arrow.zRotation)
                nodeA.physicsBody?.isDynamic = false
                nodeB.physicsBody?.isDynamic = false
                lose()
            } else {
                nodeB.removeFromParent()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lost { return }
        
        //add enemy
        if (enemyTime == 0.0) {
            enemyTime = currentTime
        } else if (enemyTime != 0.0 && enemyTime + spawnTime/Double(self.physicsWorld.speed) < currentTime) {
            makeArrow()
            enemyTime = currentTime
            spawnTime = Double.random(in: 1...4)
        }
    }
}


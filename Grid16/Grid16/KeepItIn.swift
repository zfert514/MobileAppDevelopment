//
//  KeepItIn.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/8/21.
//

import SpriteKit

class KeepItIn: GameBase {
    
    var started = false
    
    var bp = BoxPaddle()
    
    var gameLabel = SKLabelNode(text: "Keep It In")
    
    var currentTouches = Set<UITouch>()
    
    override func didMove(to view: SKView) {
        if !started {
            // enable the FPS label
            view.showsFPS = true
            let player = bp.rect
            
            self.backgroundColor = .orange
            physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            physicsBody?.friction = 0
            physicsWorld.gravity = .zero
            physicsWorld.contactDelegate = self
            
            gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY - 40)
            addChild(gameLabel)
            
            player.position = CGPoint(x: frame.midX, y: frame.midY/2)
            addChild(player)
            bp.moveDown(frame: frame)
            
            makeWalls()
            makeBall()
            makeBox()
            
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
        currentTouches.removeAll()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                bp.moveRight(frame: frame)
            case UISwipeGestureRecognizer.Direction.down:
                bp.moveDown(frame: frame)
            case UISwipeGestureRecognizer.Direction.left:
                bp.moveLeft(frame: frame)
            case UISwipeGestureRecognizer.Direction.up:
                bp.moveUp(frame: frame)
            default:
                break
            }
        }
    }
    
    func makeBox() {
        let rect = SKShapeNode(rectOf: CGSize(width: 300, height: 300))
        rect.fillColor = .clear
        rect.strokeColor = .white
        rect.glowWidth = 1.0
        rect.isAntialiased = true
        
        rect.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(rect)
    }
    
    func makeWalls() {
        
        let ceil = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ceil.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ceil.physicsBody?.isDynamic = false
        ceil.physicsBody?.contactTestBitMask = 0b0001
        ceil.physicsBody?.collisionBitMask = 0b0001
        ceil.physicsBody?.friction = 0
        ceil.alpha = 0.0
        ceil.name = "wall"
        ceil.position = CGPoint(x: frame.midX, y: frame.maxY)
        addChild(ceil)
        
        let ground = SKShapeNode(rectOf: CGSize(width: frame.maxX, height: 5))
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.maxX, height: 5))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.contactTestBitMask = 0b0001
        ground.physicsBody?.collisionBitMask = 0b0001
        ground.physicsBody?.friction = 0
        ground.alpha = 0.0
        ground.name = "wall"
        ground.position = CGPoint(x: frame.midX, y: frame.minY)
        addChild(ground)
        
        let left = SKShapeNode(rectOf: CGSize(width: 5, height: frame.maxY))
        left.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: frame.maxY))
        left.physicsBody?.isDynamic = false
        left.physicsBody?.contactTestBitMask = 0b0001
        left.physicsBody?.collisionBitMask = 0b0001
        left.physicsBody?.friction = 0
        left.alpha = 0.0
        left.name = "wall"
        left.position = CGPoint(x: frame.minX, y: frame.midY)
        addChild(left)
        
        let right = SKShapeNode(rectOf: CGSize(width: 5, height: frame.maxY))
        right.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 5, height: frame.maxY))
        right.physicsBody?.isDynamic = false
        right.physicsBody?.contactTestBitMask = 0b0001
        right.physicsBody?.collisionBitMask = 0b0001
        right.physicsBody?.friction = 0
        right.alpha = 0.0
        right.name = "wall"
        right.position = CGPoint(x: frame.maxX, y: frame.midY)
        addChild(right)
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
        let ball = SKShapeNode(circleOfRadius: 15)
        ball.fillColor = .red
        ball.strokeColor = .white
        ball.position.x = frame.midX
        ball.position.y = frame.midY
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.friction = 0
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        
        ball.physicsBody?.contactTestBitMask = 0b0001
        ball.physicsBody?.collisionBitMask = 0b0001
        ball.name = "ball"
        
        ball.physicsBody?.velocity = CGVector(dx: Double.random(in: -250...250), dy: Double.random(in: -250...250))
        
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
        
        if nodeA.name == "ball" && nodeB.name == "wall" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        } else if nodeA.name == "wall" && nodeB.name == "ball" {
            nodeA.physicsBody?.isDynamic = false
            nodeB.physicsBody?.isDynamic = false
            lose()
        }
    }
}


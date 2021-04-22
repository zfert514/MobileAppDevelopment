//
//  GameScene.swift
//  Ships
//
//  Created by Joel Hollingsworth on 4/4/21.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var isGameOver = false
    var restart = false
    
    var ship = Ship()
    var coinCount = 0
    
    var coinTime = 0.0
    var ghostTime = 0.0
    
    var shipData = [ShipPoint]()
    var ghosts = [GhostShip]()
    var ghostMoves = 200
    
    let coinSound = SKAction.playSoundFileNamed("zapThreeToneUp.mp3", waitForCompletion: false)
    let shipSound = SKAction.playSoundFileNamed("twoTone1", waitForCompletion: false)
    
    var currentTouches = Set<UITouch>()
    
    var coinLabel = SKLabelNode(text: "Coins: 0")
    
    /*
     * didMove() is called when the scene is placed into
     * the view. Initialize and setup the game here.
     */
    override func didMove(to view: SKView) {
        // enable the FPS label
        view.showsFPS = true
        
        coinLabel.position = CGPoint(x: 100, y: 150)
        addChild(coinLabel)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        ship.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(ship)
        
        if let trail = SKEmitterNode(fileNamed: "TrailingFire") {
            ship.addChild(trail)
            trail.position.y -= 15
        }
        
        makeCoin()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ship" && nodeB.name == "coin" {
            remove(coin: nodeB)
        } else if nodeA.name == "coin" && nodeB.name == "ship" {
            remove(coin: nodeA)
        }
        
        if nodeA.name == "ship" && nodeB.name == "ghost" {
            endGame()
            if let shipExplode = SKEmitterNode(fileNamed: "ShipExplode") {
                shipExplode.position = nodeA.position
                addChild(shipExplode)
            }
            run(shipSound)
            nodeA.removeFromParent()
        } else if nodeA.name == "ghost" && nodeB.name == "ship" {
            endGame()
            if let shipExplode = SKEmitterNode(fileNamed: "ShipExplode") {
                shipExplode.position = nodeB.position
                addChild(shipExplode)
            }
            run(shipSound)
            nodeB.removeFromParent()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.insert(touch)
            if let sparkParticle = SKEmitterNode(fileNamed: "SparkParticle") {
                sparkParticle.position = touch.location(in: self)
                addChild(sparkParticle)
            }
            if isGameOver {
                if let view = self.view {
                    let scene = GameScene()
                    scene.size = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height)
                    scene.scaleMode = .fill
                    view.presentScene(scene)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            currentTouches.remove(touch)
        }
    }
    
    func makeCoin() {
        let coin = SKShapeNode(circleOfRadius: 10)
        coin.fillColor = .white
        coin.strokeColor = .white
        coin.position.x = CGFloat.random(in: 20...frame.maxX - 20)
        coin.position.y = CGFloat.random(in: 20...frame.maxY - 20)
        
        coin.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        coin.physicsBody?.isDynamic = false
        coin.physicsBody?.collisionBitMask = 0b0000
        coin.physicsBody?.contactTestBitMask = 0b0001
        coin.name = "coin"
        
        addChild(coin)
    }
    
    func remove(coin: SKNode) {
        coinCount += 1
        coinLabel.text = String("Coins: \(coinCount)")
        
        run(coinSound)
        
        coin.removeFromParent()
        
        if (coinCount == 15) {
            endGame()
        }
        
        if let explosion = SKEmitterNode(fileNamed: "Explosion") {
            explosion.position = coin.position
            addChild(explosion)
        }
    }
    
    func endGame() {
        isGameOver = true
        let endLabel = SKLabelNode(text: "Play Again?")
        endLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(endLabel)
    }
    
    /*
     * update() is called on for each new frame before the
     * scene is drawn. Make the code as streamlined as possible
     * since it runs (hopefully) 60 times a second.
     */
    override func update(_ currentTime: TimeInterval) {
        //end game
        if isGameOver { return }
        
        //move the ship
        ship.update(screen: frame)
        let data = ShipPoint(position: ship.position, zRotation: ship.zRotation)
        shipData.append(data)
        
        //move the ghost ships
        for ghost in ghosts {
            ghost.update(shipData: shipData)
            ghost.moves += 1
            if ghost.lifeTime == ghost.moves {
                ghost.removeFromParent()
            }
        }
        
        //touch control
        for touch in currentTouches {
            if touch.location(in: self).x < frame.midX {
                ship.turnLeft()
            } else {
                ship.turnRight()
            }
        }
        
        //add coins every 10 seconds
        if (coinTime == 0.0) {
            coinTime = currentTime
            ghostTime = currentTime
        } else if (coinTime != 0.0 && coinTime + 10 < currentTime) {
            makeCoin()
            coinTime = currentTime
        }
        
        //add ghost every 7 seconds
        if (ghostTime != 0.0 && ghostTime + 4 < currentTime) {
            let ghostShip = GhostShip()
            ghostShip.update(shipData: shipData)
            ghostShip.lifeTime = ghostMoves
            ghosts.append(ghostShip)
            addChild(ghostShip)
            ghostShip.run(SKAction.fadeAlpha(to: 0.2, duration: 10))
            ghostTime = currentTime
            ghostMoves += 40
        }
    }
    
}

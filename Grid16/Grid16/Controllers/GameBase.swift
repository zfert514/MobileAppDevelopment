//
//  GameBase.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/18/21.
//

import Foundation
import SpriteKit

class GameBase: SKScene, SKPhysicsContactDelegate {
    
    var worldSpeed = 1.0
    var lost = false
//    var currentTouches = Set<UITouch>()
    
    func speedUp (wSpeed: Double) {
        self.physicsWorld.speed = CGFloat(wSpeed)
        worldSpeed = wSpeed
    }
    
//    func clearTouches() {
//        currentTouches.removeAll()
//    }
    
}

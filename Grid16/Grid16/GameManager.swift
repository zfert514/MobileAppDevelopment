//
//  GameManager.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/18/21.
//

import Foundation
import SpriteKit

class GameManager: ObservableObject {
    
    var miniGames = Array<SKScene>()
    var gameBase = GameBase()
    
    var currScene = SKScene()
    var currSceneIdx = -1
    
    var worldSpeed = 1.0
    var switchTime = 4.0
    var switchCount = 4.0
    
    init() {
        miniGames.append(KeepJumping())
        miniGames.append(KeepFalling())
        miniGames.append(HitTheBall())
        
        currScene = swapGame()
    }
    
    func speedUp() {
        worldSpeed += 0.2
        switchTime = switchTime / 1.1
        gameBase.worldSpeed = worldSpeed
    }
    
    func swapGame() -> SKScene {
        currSceneIdx = Int.random(in: 0..<miniGames.count)
        currScene = miniGames[currSceneIdx]
        return currScene
    }
    
    func removeCurrent() {
        miniGames.remove(at: currSceneIdx)
    }
    
    func getCurrent() -> SKScene {
        return currScene
    }
    
    func check() {
        if gameBase.lost {
            removeCurrent()
            swapGame()
            gameBase.lost = false
        }
    }
    
}

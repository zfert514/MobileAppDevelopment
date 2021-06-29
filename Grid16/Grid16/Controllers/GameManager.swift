//
//  GameManager.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/18/21.
//

import Foundation
import SpriteKit

class GameManager: ObservableObject {
    
    var miniGames = Array<GameBase>()
    
    @Published var currScene = GameBase()
    var currSceneIdx = -1
    
    var worldSpeed = 1.0
    
    var switchTime = 4.0
    var switchesForSpeed = 4.0
    var switchCount = 0.0
    
    var timer = Timer()
    
    var showSpeed = IntermediaryScene()
    var speedTime = 3.0
    var spedUp = false
    
    var points = 0
    
    var score = Score()
    
    init() {
        start()
    }
    
    func start() {
        currSceneIdx = -1
        worldSpeed = 1.0
        switchTime = 4.0
        switchesForSpeed = 4.0
        switchCount = 0.0
        timer = Timer()
        showSpeed = IntermediaryScene()
        speedTime = 3.0
        spedUp = false
        points = 0
        score = Score()
        
        miniGames.append(KeepJumping())
        miniGames.append(KeepFalling())
        miniGames.append(HitTheBall())
        miniGames.append(RedBallBad())
        miniGames.append(AvoidGreen())
        miniGames.append(KeepItIn())
        miniGames.append(ShieldCenter())
        miniGames.append(MatchArrows())
        miniGames.append(ShootBoxes())
        
        swapGame()
        
        activateTimer()
        
        let timer2 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.points += 1
            if self.score.tapped {
                self.start()
            }
        }
    }
    
    func activateTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: switchTime, repeats: true) { timer in
            print("Timer Interval: ", timer.timeInterval)
            print("World Speed: ", self.worldSpeed)
            self.swapGame()
        }
    }
    
    func endTimer() {
        timer.invalidate()
    }
    
    func speedTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: speedTime, repeats: true) { timer in
            self.swapGame()
        }
    }
    
    func speedUp() {
        if spedUp {
            spedUp = false
        }
        switchCount += 1
        if switchCount >= switchesForSpeed {
            worldSpeed = worldSpeed + 0.2
            if switchTime >= 1 {
                switchTime = switchTime - 0.4
            }
            switchCount = 0
            currScene = showSpeed
            endTimer()
            activateTimer()
            spedUp = true
        }
    }
    
    func swapGame() {
        //If game is failed, remove it
        check()
        //check there is another minigame
        if miniGames.count > 0 {
            //if number of swaps is reached speed up
            speedUp()
            //pause scene for later
            currScene.isPaused = true
            //if sped up, show the new speed
            if spedUp {
                currScene = showSpeed
                //otherwise switch to a different game
            } else {
                currSceneIdx = Int.random(in: 0..<miniGames.count)
                while miniGames[currSceneIdx] == currScene && miniGames.count > 1{
                    currSceneIdx = Int.random(in: 0..<miniGames.count)
                }
                currScene = miniGames[currSceneIdx]
                currScene.isPaused = false
            }
            currScene.speedUp(wSpeed: worldSpeed)
            //if all have failed, show score
        } else {
            currScene = score
            score.getScore(mScore: points)
            endTimer()
        }
    }
    
    func removeCurrent() {
        miniGames.remove(at: currSceneIdx)
    }
    
    func getCurrent() -> SKScene {
        return currScene
    }
    
    func check() {
        if currScene.lost {
            removeCurrent()
            currScene.lost = false
            //            swapGame()
        }
    }
    
}

//
//  Score.swift
//  Grid16
//
//  Created by Zachary Fertig on 5/11/21.
//

import SpriteKit

class Score: GameBase {
    
    var score = 0
    
    var tapped = false
    var highscore = UserDefaults.standard.integer(forKey: "HighScore")
    
    var gameLabel = SKLabelNode(text: "Game Over")
    
    var scoreLabel = SKLabelNode(text: "Score \(0)")
    var highLabel = SKLabelNode(text: "HighScore \(0)")
    
    var continueLabel = SKLabelNode(text: "Tap To Play Again")
    
    override func didMove(to view: SKView) {
        tapped = false
        view.showsFPS = true
        
        self.backgroundColor = .white
        
        gameLabel.position = CGPoint(x: frame.midX, y: frame.maxY-frame.midY/2)
        gameLabel.fontSize = 100
        gameLabel.fontColor = .black
        addChild(gameLabel)
        
        scoreLabel = SKLabelNode(text: "Score \(score)")
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = .black
        addChild(scoreLabel)
        
        highLabel = SKLabelNode(text: "Highcore \(highscore)")
        highLabel.position = CGPoint(x: frame.midX, y: frame.midY/1.5)
        highLabel.fontSize = 60
        highLabel.fontColor = .black
        addChild(highLabel)
        
        continueLabel.position = CGPoint(x: frame.midX, y: frame.midY/4)
        continueLabel.fontSize = 40
        continueLabel.fontColor = .black
        addChild(continueLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            tapped = true
        }
    }
    
    func getScore(mScore: Int) {
        score = mScore*50
        scoreLabel.text = "Score \(score)"
        highscore = UserDefaults.standard.integer(forKey: "HighScore")
        highLabel.text = "HighScore \(highscore)"
        if highscore == 0 {
            UserDefaults.standard.set(score, forKey: "HighScore")
        } else if highscore < score {
            UserDefaults.standard.set(score, forKey: "HighScore")
        }
        print(highscore)
    }
}

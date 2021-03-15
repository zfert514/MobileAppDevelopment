//
//  DiceGame.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/14/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation
import SwiftUI

class DiceGame: ObservableObject {
    
    let diceNum = 5
    
    //Model
    private var die = Die()
    private var calc = Calc()
    @Published private var dice = Dice()
    
    init() {
        for _ in 0..<diceNum {
            dice.dice.append(Die())
        }
    }
    
    // MARK: - Access to the Model
    
    func get(index: Int) -> Face {
        return dice.dice[index].dieFaceUp
    }
    
    // MARK: - Actions (Intents)
    
    func tap(index: Int) {
        dice.dice[index].selectUnselect()
    }
    
    func getColor(index: Int) -> Color {
        if (dice.dice[index].selected) {
            return Color.orange
        }
        return Color.white
    }
    
    func rollAll() {
        for i in 0..<diceNum {
            dice.dice[i] = (Die())
        }
    }
    
    func rollDice() {
        if (dice.howManySelected() == 2) {
            print(calc.addSelectedDice(dice: dice))
            rollAll()
        }
    }
}

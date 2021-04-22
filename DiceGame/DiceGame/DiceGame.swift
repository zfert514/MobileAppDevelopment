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
    private var nums = SolitareNumbers()
    @Published private var dice = Dice()
    
    init() {
        for _ in 0..<diceNum {
            dice.dice.append(Die())
        }
    }
    
    // MARK: - Access to the Model
    
    func getFace(index: Int) -> Face {
        return dice.dice[index].dieFaceUp
    }
    
    func getNum(index: Int) -> Number {
        return nums.nums[index]
    }
    
    // MARK: - Actions (Intents)
    
    func tap(index: Int) {
        dice.dice[index].selectUnselect()
    }
    
    func getColorDie(index: Int) -> Color {
        if (dice.dice[index].selected) {
            return Color.orange
        }
        return Color.white
    }
    
    func getColorNum(index: Int) -> Color {
        if (nums.nums[index].isChosen) {
            return Color.orange
        }
        return Color.black
    }
    
    func rollAll() {
        for i in 0..<diceNum {
            dice.dice[i] = (Die())
        }
    }
    
    func rollDice() {
        if (dice.howManySelected() == 2) {
            let calcNum = String(calc.addSelectedDice(dice: dice))
            let index = nums.getIndex(name: calcNum)
            if (!nums.nums[index].isChosen){
                nums.nums[index].choose()
                rollAll()
            }
        }
    }
    
    func noMoves() -> Bool {
        return !calc.haveMovesLeft(nums: nums, dice: dice)
    }
    
    func allSelected() -> Bool {
        if (dice.howManySelected() >= 11) {
            return true
        }
        return false
    }
}

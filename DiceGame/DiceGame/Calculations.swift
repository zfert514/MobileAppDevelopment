//
//  Calculations.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/14/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Calc {
    
    func addDice (die1: Die, die2: Die) -> Int {
        return die1.dieFaceUp.value + die2.dieFaceUp.value
    }
    
    func addSelectedDice (dice: Dice) -> Int{
        var total = 0
        for die in dice.dice {
            if(die.selected){
                total += die.dieFaceUp.value
            }
        }
        return total
    }
    
    func haveMovesLeft (nums: SolitareNumbers, dice: Dice) -> Bool {
        for i in 0..<dice.dice.count {
            for j in i+1..<dice.dice.count{
                let added = addDice(die1: dice.dice[i], die2: dice.dice[j])
                if (!nums.nums[nums.getIndex(name: String(added))].isChosen) {
                    return true
                }
            }
        }
        return false
    }
    
}

//
//  Calculations.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/14/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Calc {
    
    
    
    func addSelectedDice (dice: Dice) -> Int{
        var total = 0
        for die in dice.dice {
            if(die.selected){
                let name = die.dieFaceUp.name.split(separator: "-", maxSplits: 4, omittingEmptySubsequences: true)
                let num = name.last
                switch num {
                case "one":
                    total += 1
                case "two":
                    total += 2
                case "three":
                    total += 3
                case "four":
                    total += 4
                case "five":
                    total += 5
                case "six":
                    total += 6
                default: break
                    
                }
            }
        }
        return total
    }
    
}

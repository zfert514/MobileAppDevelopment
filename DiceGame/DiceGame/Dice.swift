//
//  Dice.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/14/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Dice {
    
    var dice = Array<Die>()
    
    func howManySelected() -> Int{
        var count = 0
        for die in dice {
            if (die.selected) {
                count += 1
            }
        }
        return count
    }
}

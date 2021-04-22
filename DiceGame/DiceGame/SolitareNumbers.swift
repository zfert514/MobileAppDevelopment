//
//  SolitareNumbers.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/15/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct SolitareNumbers {
    
    var numNames = ["2","3","4","5","6","7","8","9","10","11","12"]
    var nums = Array<Number>()
    
    init() {
        for name in numNames {
            nums.append(Number(name: name))
        }
    }
    
    func getIndex(name: String) -> Int {
        var index = 0
        for num in nums{
            if (num.name == name) {
                return index
            }
            index += 1
        }
        return -1
    }
    
}

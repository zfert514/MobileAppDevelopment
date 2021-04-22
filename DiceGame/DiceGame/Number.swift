//
//  Number.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/15/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Number {
    
    var name: String
    var isChosen = false
    
    mutating func choose() {
        isChosen = !isChosen
    }
}

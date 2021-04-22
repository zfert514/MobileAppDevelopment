//
//  Die.swift
//  DiceGame
//
//  Created by Zachary Fertig on 3/14/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Die {
    
    let dieFaceNames = ["dice-six-faces-one", "dice-six-faces-two", "dice-six-faces-three", "dice-six-faces-four", "dice-six-faces-five", "dice-six-faces-six"]
    var selected = false
    var dieFaceUp =  Face(name: "", value: 0)
    
    var die = Array<Face>()
    
    init() {
        var value = 1
        for face in dieFaceNames {
            die.append(Face(name: face, value: value))
            value += 1
        }
        roll()
    }
    
    mutating func roll() {
        let index = Int.random(in: 0..<die.count)
        
        dieFaceUp = die[index]
    }
    
    mutating func selectUnselect() {
        selected = !selected
    }
}

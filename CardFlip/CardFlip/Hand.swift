//
//  Hand.swift
//  CardFlip
//
//  Created by Zachary Fertig on 3/2/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Hand {
    
    var hand = Array<Card>()
    
    mutating func add(card: Card) {
        hand.append(card)
    }
    
    mutating func replace(index: Int, newCard: Card) {
        print("replacing \(hand[index])")
        hand[index] = newCard
    }
    
}

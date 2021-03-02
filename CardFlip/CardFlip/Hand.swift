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
    
    init() {
        
    }
    
    mutating func add(card: Card) {
        hand.append(card)
    }
    
    mutating func remove(card: Card) {
        var which = -1
        
        for i in 0..<hand.count {
            if(hand[i].face == card.face) {
                which = i
            }
        }
        
        if which >= 0 {
            hand[which].inUse = false
            hand.remove(at: which)
        }
    }
}

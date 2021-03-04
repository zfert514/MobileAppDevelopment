//
//  Deck.swift
//  CardFlip
//
//  Created by Zachary Fertig on 3/2/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

struct Deck {
    
    let cardValue = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    let cardSuit = ["C", "D", "H", "S"]
    
    var deck = Array<Card>()
    
    init() {
        for value in cardValue {
            for suit in cardSuit{
                deck.append(Card(face: value + suit))
                print("created: " + value + suit)
            }
        }
    }
    
    mutating func deal() -> Card {
        var index = Int.random(in: 0..<deck.count)
        
        while deck[index].inUse {
            index = Int.random(in: 0..<deck.count)
        }
        
        deck[index].inUse = true
        print("dealing \(deck[index].face)")
        
        return deck[index]
    }
    
    mutating func mark(inUse: Bool, card: Card) {
        for i in 0..<deck.count {
            if deck[i].face == card.face {
                deck[i].inUse = inUse
                break
            }
        }
    }
    
}

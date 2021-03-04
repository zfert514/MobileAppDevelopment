//
//  FlipCard.swift
//  CardFlip
//  ViewModel
//
//  Created by Zachary Fertig on 3/4/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

class FlipCard: ObservableObject {
    
    let handSize = 4
    
    // model
    private var deck = Deck()
    @Published private var hand = Hand()
    
    init() {
        // get initial hand
        for _ in 0..<handSize {
            hand.add(card: deck.deal())
        }
        
        print(hand)
    }
    
    // MARK: - Access to the Model
    
    func get(index: Int) -> Card {
        return hand.hand[index]
    }
    
    // MARK: - Actions (Intents)
    
    func tap(index: Int) {
        deck.mark(inUse: false, card: hand.hand[index]) // release card
        hand.replace(index: index, newCard: deck.deal()) // deal new one
    }
    
}

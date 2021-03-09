//
//  ColorMatchGame.swift
//  ColorMatch
//
//  Created by Zachary Fertig on 3/9/21.
//  Copyright © 2021 Zachary Fertig. All rights reserved.
//

import Foundation

class ColorMatchGame: ObservableObject {
    
    // the model
    private var r: Double
    private var g: Double
    private var b: Double
    
    init() {
        r = Double.random(in: 0...1)
        g = Double.random(in: 0...1)
        b = Double.random(in: 0...1)
    }
    
    //MARK: - Acess to the Model
    
    func getRed() -> Double {
        r
    }
    func getGreen() -> Double {
        g
    }
    func getBlue() -> Double {
        b
    }
    
    //Mark: - Actions (Intente)
    
    func computeScore(rGuess: Double, gGuess: Double, bGuess: Double) -> Int {
        let rDiff = rGuess - r
        let gDiff = gGuess - g
        let bDiff = bGuess - b
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100 + 0.5)
    }
    
}

//
//  Grid16.swift
//  Grid16
//
//  Created by Zachary Fertig on 4/17/21.
//

import Foundation
import SpriteKit

class Grid16: SKScene, ObservableObject {
    
    @Published var manager = GameManager()
    
    func getGame() -> SKScene {
        return manager.getCurrent()
    }
    
}

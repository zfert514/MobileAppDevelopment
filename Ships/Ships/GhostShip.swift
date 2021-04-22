//
//  GhostShip.swift
//  Ships
//
//  Created by Zachary Fertig on 4/12/21.
//

import SpriteKit

class GhostShip: Ship {
    
    private var currentMove = 0
    var lifeTime = 0
    var moves = 0
    
    override init() {
        super.init()
        self.fillColor = .gray
        self.name = "ghost"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(shipData: [ShipPoint]) {
        self.position.x = shipData[currentMove].position.x
        self.position.y = shipData[currentMove].position.y
        self.zRotation = shipData[currentMove].zRotation
        currentMove += 1
    }
    
}

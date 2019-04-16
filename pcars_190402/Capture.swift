//
//  Capture.swift
//  pcars_190402
//
//  Created by Leigh McLean on 4/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Capture {
    
    var gameState : GameState
    
    init() {
        self.gameState = GameState()
    }
    
    func capturePacket(packet: Packet) {
        self.gameState.capture(capture: self, packet: packet)
    }
    
    func nextGameState(gameState: GameState) {
        self.gameState = gameState
    }
    
}

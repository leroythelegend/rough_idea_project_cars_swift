//
//  GameState.swift
//  pcars_190402
//
//  Created by Leigh McLean on 4/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class GameState {
    
    func capture(capture: Capture, packet: Packet) {
        
    }
    
    func next(capture: Capture, gameState: GameState) {
        capture.nextGameState(gameState: gameState)
    }
}

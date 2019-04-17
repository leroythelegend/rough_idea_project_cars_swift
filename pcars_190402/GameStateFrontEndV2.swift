//
//  GameStateFrontEndV2.swift
//  pcars_190402
//
//  Created by Leigh McLean on 4/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class GameStateFrontEndV2: GameState {
    
    var process : Process
    var factory : GameStateFactoryV2
    
    init(process : Process) {
        self.process = process
        self.factory = GameStateFactoryV2()
    }
    
    override func capture(capture: Capture, packet: Packet) {
        
        if packet is PacketGameStateData {
            let p : PacketGameStateData = packet as! PacketGameStateData
            let state : DecoderGameState = p.gameState as! DecoderGameState
            
            if state.gameState.int() != 1 { // GAME_FRONT_END
                next(capture: capture, gameState: self.factory.createGameState(gameState: state.gameState.int(), process: self.process))
            }
        }
    }
}

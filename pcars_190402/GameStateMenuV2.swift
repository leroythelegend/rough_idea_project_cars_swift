//
//  GameStateMenuV2.swift
//  pcars_190402
//
//  Created by Leigh McLean on 4/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class GameStateMenuV2: GameState {
    
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
            
            if state.gameState.int() != 4 { // GAME_INGAME_INMENU_TIME_TICKING
                next(capture: capture, gameState: self.factory.createGameState(gameState: state.gameState.int(), process: self.process))
            }
            else {
                // process.menu(packet: packet)
            }
        }
        else {
            // process.menu(packet: packet)
        }
    }
}

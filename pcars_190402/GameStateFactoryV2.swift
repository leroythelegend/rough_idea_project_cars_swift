//
//  GameStateFactoryV2.swift
//  pcars_190402
//
//  Created by Leigh McLean on 4/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class GameStateFactoryV2 {
    
    func createGameState(gameState: Int, process: Process) -> (GameState) {
        switch gameState {
        case 1:
            return GameStateFrontEndV2(process: process)
        case 2:
            return GameStatePlayingV2(process: process)
        case 4:
            return GameStateMenuV2(process: process)
        default:
            // need to return nil and do nothing
            return GameStatePlayingV2(process: process)
        }
    }
}

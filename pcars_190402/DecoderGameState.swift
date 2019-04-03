//
//  DecoderGameState.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class DecoderGameState : Decoder {
   
    var gameState : Decoder
    var sessionState : Decoder
    
    override init() {
        
        self.gameState = Decoder4LSBits()
        self.sessionState = Decoder4MSBits()
        
        super.init()
    }
    
    override func decode(data: inout Data) {
        gameState.decode(data: &data)
        sessionState.decode(data: &data)

        data = data.advanced(by: 1)
    }
}

//
//  PacketGameStateData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketGameStateData  : Packet {
    
    var buildVersionNumber : Decoder
    var gameState : Decoder
    var ambientTemperature : Decoder
    var trackTemperature : Decoder
    var rainDensity : Decoder
    var snowDensity : Decoder
    var windSpeed : Decoder
    var windDirectionX : Decoder
    var windDirectionY : Decoder
    
    
    override init() {
        
        self.buildVersionNumber = Decoder16()
        self.gameState = DecoderGameState()
        self.ambientTemperature = Decoder8()
        self.trackTemperature = Decoder8()
        self.rainDensity = Decoder8()
        self.snowDensity = Decoder8()
        self.windSpeed = Decoder8()
        self.windDirectionX = Decoder8()
        self.windDirectionY = Decoder8()
        
        super.init()
        
        super.add(decoder: &buildVersionNumber)
        super.add(decoder: &gameState)
        super.add(decoder: &ambientTemperature)
        super.add(decoder: &trackTemperature)
        super.add(decoder: &rainDensity)
        super.add(decoder: &snowDensity)
        super.add(decoder: &windSpeed)
        super.add(decoder: &windDirectionX)
        super.add(decoder: &windDirectionY)
    }
}

//
//  PacketGameStateData.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Game State Data
///
///    struct sGameStateData
///    {
///        static const unsigned int sPacketSize = 24;
///        PacketBase sBase;                   //10
///        unsigned short mBuildVersionNumber; //12
///        char mGameState;                    //15 -- first 3 bits are used for game state enum, second 3 bits for session state enum See shared memory example file for the enums
///        signed char sAmbientTemperature;    //16
///        signed char sTrackTemperature;      //17
///        unsigned char sRainDensity;         //18
///        unsigned char sSnowDensity;         //19 --  this will be non zero only in Snow season, in other seasons whatever is falling from the sky is reported as rain
///        signed char sWindSpeed;             //20
///        signed char sWindDirectionX;        //21
///        signed char sWindDirectionY;        //22 padded to 24
///    };
///

class PacketGameStateData  : Packet {
    
    var buildVersionNumber : Decoder
    var gameState : Decoder
    var sessionState  : Decoder
    private var increment : Decoder
    var ambientTemperature : Decoder
    var trackTemperature : Decoder
    var rainDensity : Decoder
    var snowDensity : Decoder
    var windSpeed : Decoder
    var windDirectionX : Decoder
    var windDirectionY : Decoder
    
    ///
    /// PacketGameStateData init
    ///
    
    override init() {
        
        self.buildVersionNumber = Decoder16()
        self.gameState = Decoder4LSBits()
        self.sessionState = Decoder4MSBits()
        self.increment = DecoderIncrement(amount: 1)
        self.ambientTemperature = Decoder8()
        self.trackTemperature = Decoder8()
        self.rainDensity = Decoder8()
        self.snowDensity = Decoder8()
        self.windSpeed = Decoder8()
        self.windDirectionX = Decoder8()
        self.windDirectionY = Decoder8()
        
        super.init()
        
        super.addDecoder(self.buildVersionNumber)
        super.addDecoder(self.gameState)
        super.addDecoder(self.sessionState)
        super.addDecoder(self.increment)
        super.addDecoder(self.ambientTemperature)
        super.addDecoder(self.trackTemperature)
        super.addDecoder(self.rainDensity)
        super.addDecoder(self.snowDensity)
        super.addDecoder(self.windSpeed)
        super.addDecoder(self.windDirectionX)
        super.addDecoder(self.windDirectionY)
    }
}

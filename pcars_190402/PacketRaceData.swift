//
//  PacketRaceData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketRaceData  : Packet {
    
    var worldFastestLapTime : Decoder
    var personalFastestLapTime : Decoder
    var personalFastestSector1Time : Decoder
    var personalFastestSector2Time : Decoder
    var personalFastestSector3Time : Decoder
    var worldFastestSector1Time : Decoder
    var worldFastestSector2Time : Decoder
    var worldFastestSector3Time : Decoder
    var trackLength : Decoder
    var trackLocation : Decoder
    var trackVariation : Decoder
    var translatedTrackLocation : Decoder
    var translatedTrackVariation : Decoder
    var isTimedLap : Decoder
    var lapsTimeInEvent : Decoder
    private var increment : Decoder
    var enforcedPitStopLap : Decoder
    
    override init() {
        
        self.worldFastestLapTime = Decoder32()
        self.personalFastestLapTime = Decoder32()
        self.personalFastestSector1Time = Decoder32()
        self.personalFastestSector2Time = Decoder32()
        self.personalFastestSector3Time = Decoder32()
        self.worldFastestSector1Time = Decoder32()
        self.worldFastestSector2Time = Decoder32()
        self.worldFastestSector3Time = Decoder32()
        self.trackLength = Decoder32()
        self.trackLocation = DecoderString(length: 64)
        self.trackVariation = DecoderString(length: 64)
        self.translatedTrackLocation = DecoderString(length: 64)
        self.translatedTrackVariation = DecoderString(length: 64)
        self.isTimedLap = DecoderMSBit()
        self.lapsTimeInEvent = Decoder15LSBits()
        self.increment = DecoderIncrement(amount: 2)
        self.enforcedPitStopLap = Decoder8()
        
        super.init()
        
        super.addDecoder(self.worldFastestLapTime)
        super.addDecoder(self.personalFastestLapTime)
        super.addDecoder(self.personalFastestSector1Time)
        super.addDecoder(self.personalFastestSector2Time)
        super.addDecoder(self.personalFastestSector3Time)
        super.addDecoder(self.worldFastestSector1Time)
        super.addDecoder(self.worldFastestSector2Time)
        super.addDecoder(self.worldFastestSector3Time)
        super.addDecoder(self.trackLength)
        super.addDecoder(self.trackLocation)
        super.addDecoder(self.trackVariation)
        super.addDecoder(self.translatedTrackLocation)
        super.addDecoder(self.translatedTrackVariation)
        super.addDecoder(self.isTimedLap)
        super.addDecoder(self.lapsTimeInEvent)
        super.addDecoder(self.increment)
        super.addDecoder(self.enforcedPitStopLap)
    }
}




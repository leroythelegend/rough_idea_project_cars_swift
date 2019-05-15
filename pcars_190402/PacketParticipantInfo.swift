//
//  PacketParticipantInfo.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Participant Info
///
///    struct sParticipantInfo
///    {
///        signed short sWorldPosition[3];     // 0 --
///        signed short sOrientation[3];       // 6 -- Quantized heading (-PI .. +PI) , Quantized pitch (-PI / 2 .. +PI / 2),  Quantized bank (-PI .. +PI).
///        unsigned short sCurrentLapDistance; // 12 --
///        unsigned char sRacePosition;        // 14 -- holds the race position, + top bit shows if the participant is active or not
///        unsigned char sSector;              // 15 -- sector + extra precision bits for x/z position
///        unsigned char sHighestFlag;         // 16 -- (enum 3 bits/enum 2 bits) Flag colour and reason
///        unsigned char sPitModeSchedule;     // 17 -- (enum 3 bits/enum 2 bits) Pit mode and Pit schedule
///        unsigned short sCarIndex;           // 18 -- top bit shows if participant is (local or remote) human player or not
///        unsigned char sRaceState;           // 20 -- race state flags + invalidated lap indication --
///        unsigned char sCurrentLap;          // 21 --
///        float sCurrentTime;                 // 22 --
///        float sCurrentSectorTime;           // 26 --
///        unsigned short sMPParticipantIndex; // 30 --  matching sIndex from sParticipantsData
///    };

class PacketParticipantInfo  : Packet {
   
    var worldPositions : Array<Decoder>
    var orientations : Array<Decoder>
    var currentLapDistance : Decoder
    var racePosition : Decoder
    var isActive : Decoder
    private var increment : Decoder
    private var increment2 : Decoder
    var precisionXPosition : Decoder
    var precisionZPosition : Decoder
    var sector : Decoder
    var flagColour : Decoder
    var flagReason : Decoder
    var pitMode : Decoder
    var pitSchedule : Decoder
    var isLocal : Decoder
    var carIndex : Decoder
    var isValidLap : Decoder
    var raceState : Decoder
    var currentLap : Decoder
    var currentTime : Decoder
    var currentSectorTime : Decoder
    var participantIndex : Decoder
    
    ///
    /// PacketParticipantInfo init
    ///
    
    override init() {
        
        self.worldPositions = Array<Decoder>()
        self.orientations = Array<Decoder>()
        
        for _ in 1...3 {
            self.worldPositions.append(Decoder16())
            self.orientations.append(Decoder16())
        }
        
        self.currentLapDistance = Decoder16()
        self.racePosition = Decoder7LSBits()
        self.isActive = DecoderMSBit()
        self.increment = DecoderIncrement(amount: 1)
        self.increment2 = DecoderIncrement(amount: 2)
        self.precisionXPosition = Decoder2MSBits()
        self.precisionZPosition = Decoder2NextMSBits()
        self.sector = Decoder4LSBits()
        self.flagColour = Decoder4MSBits()
        self.flagReason = Decoder4LSBits()
        self.pitSchedule = Decoder4MSBits()
        self.pitMode = Decoder4LSBits()
        self.isLocal = DecoderMSBit()
        self.carIndex = Decoder15LSBits()
        self.isValidLap = Decoder4thBit()
        self.raceState = Decoder3LSBits()
        self.currentLap = Decoder8()
        self.currentTime = Decoder32()
        self.currentSectorTime = Decoder32()
        self.participantIndex = Decoder16()
        
        super.init()
        
        for worldPosition in self.worldPositions {
            super.addDecoder(worldPosition)
        }
        for orientation in self.orientations {
            super.addDecoder(orientation)
        }
        super.addDecoder(self.currentLapDistance)
        super.addDecoder(self.racePosition)
        super.addDecoder(self.isActive)
        super.addDecoder(self.increment)
        super.addDecoder(self.precisionXPosition)
        super.addDecoder(self.precisionZPosition)
        super.addDecoder(self.sector)
        super.addDecoder(self.increment)
        super.addDecoder(self.flagColour)
        super.addDecoder(self.flagReason)
        super.addDecoder(self.increment)
        super.addDecoder(self.pitMode)
        super.addDecoder(self.pitSchedule)
        super.addDecoder(self.increment)
        super.addDecoder(self.isLocal)
        super.addDecoder(self.carIndex)
        super.addDecoder(self.increment2)
        super.addDecoder(self.isValidLap)
        super.addDecoder(self.raceState)
        super.addDecoder(self.increment)
        super.addDecoder(self.currentLap)
        super.addDecoder(self.currentTime)
        super.addDecoder(self.currentSectorTime)
        super.addDecoder(self.participantIndex)
    }
}

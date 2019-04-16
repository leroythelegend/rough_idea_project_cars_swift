//
//  PacketParticipantStatsInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketParticipantStatsinfo  : Packet {
    
    var fastestLapTime : Decoder
    var lastLapTime : Decoder
    var lastSectorTime : Decoder
    var fastestSector1Time : Decoder
    var fastestSector2Time : Decoder
    var fastestSector3Time : Decoder
    var participantOnlineRep : Decoder
    var participantIndex : Decoder
    
    override init() {
        
        self.fastestLapTime = Decoder32()
        self.lastLapTime = Decoder32()
        self.lastSectorTime = Decoder32()
        self.fastestSector1Time = Decoder32()
        self.fastestSector2Time = Decoder32()
        self.fastestSector3Time = Decoder32()
        self.participantOnlineRep = Decoder32()
        self.participantIndex = Decoder16()
        
        super.init()
        
        super.addDecoder(self.fastestLapTime)
        super.addDecoder(self.lastLapTime)
        super.addDecoder(self.lastSectorTime)
        super.addDecoder(self.fastestSector1Time)
        super.addDecoder(self.fastestSector2Time)
        super.addDecoder(self.fastestSector3Time)
        super.addDecoder(self.participantOnlineRep)
        super.addDecoder(self.participantIndex)
    }
}

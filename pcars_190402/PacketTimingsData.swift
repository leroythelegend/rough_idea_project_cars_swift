//
//  PacketTimingsData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 10/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketTimingsData  : Packet {

    var numParticipants : Decoder
    var participantsChangedTimestamp : Decoder
    var eventTimeRemaining : Decoder
    var splitTimeAhead : Decoder
    var splitTimeBehind : Decoder
    var splitTime : Decoder
    var partcipants : Array<Decoder>
    var localParticipantIndex : Decoder
    var tickCount : Decoder
    
    override init() {
        
        self.numParticipants = Decoder8()
        self.participantsChangedTimestamp = Decoder32()
        self.eventTimeRemaining = Decoder32()
        self.splitTimeAhead = Decoder32()
        self.splitTimeBehind = Decoder32()
        self.splitTime = Decoder32()
        self.partcipants = Array(repeating: DecoderParticipantInfo(), count: 32)
        self.localParticipantIndex = Decoder16()
        self.tickCount = Decoder32()
        
        super.init()
        
        super.addDecoder(numParticipants)
        super.addDecoder(participantsChangedTimestamp)
        super.addDecoder(eventTimeRemaining)
        super.addDecoder(splitTimeAhead)
        super.addDecoder(splitTimeBehind)
        super.addDecoder(splitTime)
        for partcipant in partcipants {
            super.addDecoder(partcipant)
        }
        super.addDecoder(localParticipantIndex)
        super.addDecoder(tickCount)
    }
}

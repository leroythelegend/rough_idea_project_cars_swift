//
//  PacketTimeStatsData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketTimeStatsData  : Packet {
    
    var participantsChangedTimestamp : Decoder
    var participantsStats : Array<Decoder>
    
    override init() {
        
        self.participantsChangedTimestamp = Decoder32()
        self.participantsStats = Array(repeating: DecoderParticipantStatsInfo(), count: 32)
        
        super.init()
        
        super.addDecoder(participantsChangedTimestamp)
        for participantStat in self.participantsStats {
            super.addDecoder(participantStat)
        }
    }
}



//
//  PacketTimeStatsData.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Time Stats Data
///
///    struct sParticipantsStats
///    {
///        sParticipantStatsInfo    sParticipants[UDP_STREAMER_PARTICIPANTS_SUPPORTED]; //1024
///    };
///
///    struct sTimeStatsData
///    {
///        static const unsigned int  sPacketSize = 1024;
///        PacketBase                 sBase;        // 0 12
///        unsigned int               sParticipantsChangedTimestamp; // 12
///        sParticipantsStats         sStats;       // 16 + 1024
///    };
///

class PacketTimeStatsData  : Packet {
    
    var participantsChangedTimestamp : Decoder
    var participantsStats : Array<Decoder>
   
    ///
    /// PacketTimeStatsData init
    ///
    
    override init() {
        
        self.participantsChangedTimestamp = Decoder32()
        self.participantsStats = Array<Decoder>()
        
        for _ in 1...32 {
            self.participantsStats.append(DecoderParticipantStatsInfo())
        }
        
        super.init()
        
        super.addDecoder(participantsChangedTimestamp)
        for participantStat in self.participantsStats {
            super.addDecoder(participantStat)
        }
    }
}



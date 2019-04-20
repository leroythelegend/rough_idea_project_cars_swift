//
//  PacketTimingsData.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Timings Data
///
///    struct sTimingsData
///    {
///        static const unsigned int sPacketSize = 1063;
///        PacketBase                sBase;                         // 0 12
///        signed char               sNumParticipants;              // 12 --
///        unsigned int              sParticipantsChangedTimestamp; // 13 --
///        float                     sEventTimeRemaining;           // 17  // time remaining, -1 for invalid time,  -1 - laps remaining in lap based races  --
///        float                     sSplitTimeAhead;               // 21 --
///        float                     sSplitTimeBehind;              // 25 --
///        float                     sSplitTime;                    // 29 --
///        sParticipantInfo          sPartcipants[UDP_STREAMER_PARTICIPANTS_SUPPORTED]; // 33 1024
///        unsigned short            sLocalParticipantIndex;        // 1057 -- identifies which of the MP participants is the local player
///        unsigned int              sTickCount;                    // 1059
///    };
///

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

    ///
    /// PacketTimingsData init
    ///
    
    override init() {
        
        self.numParticipants = Decoder8()
        self.participantsChangedTimestamp = Decoder32()
        self.eventTimeRemaining = Decoder32()
        self.splitTimeAhead = Decoder32()
        self.splitTimeBehind = Decoder32()
        self.splitTime = Decoder32()
        self.partcipants = Array<Decoder>()
        
        for _ in 1...32 {
            self.partcipants.append(DecoderParticipantInfo())
        }
        
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

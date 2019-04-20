//
//  PacketParticipantsData.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Participants Data
///
///    struct sParticipantsData
///    {
///        static const unsigned int sPacketSize = 1136;
///        PacketBase                sBase;                                                       //    0     12
///        unsigned int              sParticipantsChangedTimestamp;                               //    12    4
///        char                      sName[PARTICIPANTS_PER_PACKET][PARTICIPANT_NAME_LENGTH_MAX]; //    16    1024
///        unsigned int              sNationality[PARTICIPANTS_PER_PACKET];                       //    1040 64
///        unsigned short            sIndex[PARTICIPANTS_PER_PACKET];                             //  1104 32 -- session unique index for MP races
///    };
///

class PacketParticipantsData  : Packet {
    
    var participantsChangedTimestamp : Decoder
    var names : Array<Decoder>
    var nationalities : Array<Decoder>
    var indexs : Array<Decoder>
    
    ///
    /// PacketParticipantsData init
    ///
    
    override init() {
        
        self.participantsChangedTimestamp = Decoder32()
        self.names = Array<Decoder>()
        self.nationalities = Array<Decoder>()
        self.indexs = Array<Decoder>()

        for _ in 1...16 {
            self.names.append(DecoderString(length: 64))
            self.nationalities.append(Decoder32())
            self.indexs.append(Decoder16())
        }
        
        super.init()
        
        super.addDecoder(self.participantsChangedTimestamp)
        for name in self.names {
            super.addDecoder(name)
        }
        for nationality in self.nationalities {
            super.addDecoder(nationality)
        }
        for index in self.indexs {
            super.addDecoder(index)
        }
    }
}

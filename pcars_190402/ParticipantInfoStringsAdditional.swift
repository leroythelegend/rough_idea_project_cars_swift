//
//  ParticipantInfoStringsAdditional.swift
//  pcars_190402
//
//  Created by Leigh McLean on 11/5/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Foundation

///
///  Packet Participant Info Strings Additional
///
///  struct sParticipantInfoStringsAdditional
///  {
///    static const             u32 sPacketSize = 1028;
///    u16   sBuildVersionNumber;         // 0
///    u8    sPacketType;                 // 2
///    u8    sOffset;                     // 3
///    char  sName[16][64];               // 4
///    // 1028
///  };
///

class ParticipantInfoStringsAdditional : Packet {
    
    var offset: Decoder
    var names: Array<Decoder>
    
    ///
    /// ParticipantInfoStringsAdditional init
    ///
    
    override init() {
        
        self.offset = Decoder8()
        
        self.names = Array<Decoder>()
        for _ in 1...16 {
            self.names.append(DecoderString(length: 64))
        }
        
        super.init()
        
        super.addDecoder(self.offset)
        
        for name in self.names {
            super.addDecoder(name)
        }
    }
}


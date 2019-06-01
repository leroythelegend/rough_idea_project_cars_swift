//
//  PacketParticipantInfoStrings.swift
//  pcars_190402
//
//  Created by Leroy on 24/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation


///
/// Packet Participant Info Strings
///
///
///   struct sParticipantInfoStrings
///   {
///       static const    u32 sPacketSize = 1347;
///       u16     sBuildVersionNumber;    // 0
///       u8      sPacketType;            // 2
///       char    sCarName[64];           // 3
///       char    sCarClassName[64];      // 67
///       char    sTrackLocation[64];     // 131
///       char    sTrackVariation[64];    // 195
///       char    sName[16][64];          // 259
///       f32     sFastestLapTime[16];    // 1283
///       // 1347
///   };
///

class PacketParticipantInfoStrings : Packet {
    
    var carName: Decoder
    var carClassName: Decoder
    var trackLocation: Decoder
    var trackVariation: Decoder
    var names: Array<Decoder>
    var fastestLapTimes: Array<Decoder>
 
    ///
    /// PacketParticipantInfoStrings
    ///
    
    override init() {
        
        self.carName = DecoderString(length: 64)
        self.carClassName = DecoderString(length: 64)
        self.trackLocation = DecoderString(length: 64)
        self.trackVariation = DecoderString(length: 64)
        
        self.names = Array<Decoder>()
        for _ in 1...16 {
            self.names.append(DecoderString(length: 64))
        }
        
        self.fastestLapTimes = Array<Decoder>()
        for _ in 1...16 {
            self.fastestLapTimes.append(Decoder32())
        }
        
        super.init()
        
        super.addDecoder(self.carName)
        super.addDecoder(self.carClassName)
        super.addDecoder(self.trackLocation)
        super.addDecoder(self.trackVariation)
        
        for name in self.names {
            super.addDecoder(name)
        }
        
        for fastestLapTime in self.fastestLapTimes {
            super.addDecoder(fastestLapTime)
        }
    }
}

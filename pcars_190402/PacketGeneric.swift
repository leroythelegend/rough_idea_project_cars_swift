//
//  PacketGeneric.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Format 1 packets start with these two attributes
///

class PacketGeneric  : Packet {
    
    var buildVersionNumber: Decoder
    var sequenceNumber: Decoder
    var packetType: Decoder
    var increment: Decoder

    ///
    /// PacketGeneric init
    ///
    
    override init() {
        
        self.buildVersionNumber = Decoder16()
        self.sequenceNumber = Decoder6MSBits()
        self.packetType = Decoder2LSBits()
        self.increment = DecoderIncrement(amount: 1)
        
        super.init()
        
        super.addDecoder(self.buildVersionNumber)
        super.addDecoder(self.sequenceNumber)
        super.addDecoder(self.packetType)
        super.addDecoder(self.increment)
    }
}

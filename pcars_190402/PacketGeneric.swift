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
    
    var buildVersionNumber : Decoder
    var packetType : Decoder

    ///
    /// PacketGeneric init
    ///
    
    override init() {
        
        self.buildVersionNumber = Decoder16()
        self.packetType = Decoder8()
        
        super.init()
        
        super.addDecoder(buildVersionNumber)
        super.addDecoder(packetType)

    }
}

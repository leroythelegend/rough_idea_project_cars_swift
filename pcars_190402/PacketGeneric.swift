//
//  PacketGeneric.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketGeneric  : Packet {
    
    var buildVersionNumber : Decoder
    var packetType : Decoder

    override init() {
        
        self.buildVersionNumber = Decoder16()
        self.packetType = Decoder8()
        
        super.init()
        
        super.addDecoder(buildVersionNumber)
        super.addDecoder(packetType)

    }
}

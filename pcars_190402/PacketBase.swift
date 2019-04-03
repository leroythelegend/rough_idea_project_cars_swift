//
//  PacketBase.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketBase  : Packet {
    
    var packetNumber : Decoder
    var categoryPacketNumber : Decoder
    var partialPacketIndex : Decoder
    var partialPacketNumber : Decoder
    var packetType : Decoder
    var packetVersion : Decoder
    
    override init() {
    
        self.packetNumber = Decoder32()
        self.categoryPacketNumber = Decoder32()
        self.partialPacketIndex = Decoder8()
        self.partialPacketNumber = Decoder8()
        self.packetType = Decoder8()
        self.packetVersion = Decoder8()
        
        super.init()
        
        super.add(decoder: &packetNumber)
        super.add(decoder: &categoryPacketNumber)
        super.add(decoder: &partialPacketIndex)
        super.add(decoder: &partialPacketNumber)
        super.add(decoder: &packetType)
        super.add(decoder: &packetVersion)
    }
}

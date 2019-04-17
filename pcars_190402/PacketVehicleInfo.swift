//
//  PacketVehicleInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketVehicleInfo  : Packet {
    
    var index : Decoder
    var vehicleClass : Decoder
    var name : Decoder
    
    override init() {
        
        self.index = Decoder16()
        self.vehicleClass = Decoder32()
        self.name = DecoderString(length: 64)
        
        super.init()
        
        super.addDecoder(self.index)
        super.addDecoder(self.vehicleClass)
        super.addDecoder(self.name)
    }
}

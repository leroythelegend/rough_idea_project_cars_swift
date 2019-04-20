//
//  PacketVehicleInfo.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Vehicle Info
///
///    struct sVehicleInfo
///    {
///        unsigned short  sIndex; // 0 2
///        unsigned int    sClass; // 2 6
///        char            sName[VEHICLE_NAME_LENGTH_MAX]; // 6 70
///    }; // padded to 72
///

class PacketVehicleInfo  : Packet {
    
    var index : Decoder
    var vehicleClass : Decoder
    var name : Decoder
    
    ///
    /// Packet Vehicle Info
    ///
    
    override init() {
        
        self.index = Decoder32()
        self.vehicleClass = Decoder32()
        self.name = DecoderString(length: 64)
        
        super.init()
        
        super.addDecoder(self.index)
        super.addDecoder(self.vehicleClass)
        super.addDecoder(self.name)
    }
}

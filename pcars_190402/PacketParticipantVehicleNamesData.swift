//
//  PacketParticipantVehicleNamesData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketParticipantVehicleNamesData  : Packet {
    
    var vehicles : Array<Decoder>
    
    override init() {
        
        self.vehicles = Array(repeating: DecoderVehicleInfo(), count: 16)
        
        super.init()
        
        for vehicle in vehicles {
            super.addDecoder(vehicle)
        }
    }
}

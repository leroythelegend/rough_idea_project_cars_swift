//
//  PacketParticipantVehicleNamesData.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Participant Vehicle Names Data
///
///
///    struct sParticipantVehicleNamesData
///    {
///        static const unsigned int sPacketSize = 1164;
///        PacketBase                sBase; // 0 12
///        sVehicleInfo              sVehicles[VEHICLES_PER_PACKET]; //12 16*72
///    };    // 1164
///

class PacketParticipantVehicleNamesData  : Packet {
    
    var vehicles : Array<Decoder>
    
    ///
    /// PacketParticipantVehicleNamesData init
    ///
    
    override init() {
        
        self.vehicles = Array<Decoder>()
        
        for _ in 1...16 {
            self.vehicles.append(DecoderVehicleInfo())
        }
        
        super.init()
        
        for vehicle in self.vehicles {
            super.addDecoder(vehicle)
        }
    }
}

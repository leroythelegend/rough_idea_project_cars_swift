//
//  DecoderPacketVehicleInfo.swift
//  pcars_190402
//
//  Created by Leroyt on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder Vehicle Info
///

class DecoderVehicleInfo : Decoder {
    
    private var bytes : Data
    
    ///
    /// DecoderVehicleInfo init
    ///
    
    override init() {
        self.bytes = Data(count: 72)
    }
    
    ///
    /// Decode VehicleInfo
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= 72 else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<72)
        guard data.count > 72 else {
            return
        }
        data = data.advanced(by: 72)
    }
    
    ///
    /// Returns PacketVehicleInfo
    ///
    /// - returns:
    ///   - participantStatsInfo: participant Stats Info
    ///
    
    override func packetVehicleInfo() throws -> PacketVehicleInfo {
        let packetVehicleInfo = PacketVehicleInfo()
        
        try packetVehicleInfo.decode(data: &self.bytes)
        
        return packetVehicleInfo
    }
}


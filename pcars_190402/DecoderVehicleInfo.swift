//
//  DecoderPacketVehicleInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class DecoderVehicleInfo : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 70)
    }
    
    override func decode(data: inout Data) {
        guard data.count >= 70 else {
            self.bytes = Data(repeating: 0xFF, count: 70)
            return
        }
        bytes = data.subdata(in: 0..<70)
        guard data.count != 70 else {
            return
        }
        data = data.advanced(by: 70)
    }
    
    override func packetVehicleInfo() -> PacketVehicleInfo {
        let packetVehicleInfo = PacketVehicleInfo()
        
        packetVehicleInfo.decode(data: &bytes)
        
        return packetVehicleInfo
    }
}


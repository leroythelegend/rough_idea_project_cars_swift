//
//  DecoderClassInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation


class DecoderClassInfo : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 70)
    }
    
    override func decode(data: inout Data) {
        guard data.count >= 24 else {
            self.bytes = Data(repeating: 0xFF, count: 24)
            return
        }
        bytes = data.subdata(in: 0..<24)
        guard data.count != 24 else {
            return
        }
        data = data.advanced(by: 24)
    }
    
    override func packetClassInfo() -> PacketClassInfo {
        let packetClassInfo = PacketClassInfo()
        
        packetClassInfo.decode(data: &bytes)
        
        return packetClassInfo
    }
}

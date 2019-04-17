//
//  DecoderParticipantInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 10/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class DecoderParticipantInfo : Decoder {

    private var bytes : Data
    
    override init() {
        bytes = Data(count: 32)
    }
    
    override func decode(data: inout Data) {
        guard data.count >= 32 else {
            self.bytes = Data(repeating: 0xFF, count: 32)
            return
        }
        bytes = data.subdata(in: 0..<32)
        guard data.count != 32 else {
            return
        }
        data = data.advanced(by: 32)
    }

    override func participantInfo() -> PacketParticipantInfo {
        let packetParticipantInfo = PacketParticipantInfo()
        
        packetParticipantInfo.decode(data: &bytes)
        
        return packetParticipantInfo
    }
}

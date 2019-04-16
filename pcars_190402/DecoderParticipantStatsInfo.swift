//
//  DecoderParticipantStatsInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class DecoderParticipantStatsInfo : Decoder {
    
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
        guard data.count != 70 else {
            return
        }
        data = data.advanced(by: 32)
    }
    
    override func participantStatsInfo() -> PacketParticipantStatsinfo {
        let packetParticipantStatsInfo = PacketParticipantStatsinfo()
        
        packetParticipantStatsInfo.decode(data: &bytes)
        
        return packetParticipantStatsInfo
    }
}

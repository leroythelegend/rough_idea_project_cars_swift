//
//  DecoderParticipantStatsInfo.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder Participant Stats Info
///

class DecoderParticipantStatsInfo : Decoder {
    
    private var bytes : Data
    private var packetParticipantStatsInfo : PacketParticipantStatsinfo
   
    ///
    /// DecoderParticipantStatsInfo init
    ///
    
    override init() {
        self.bytes = Data(count: 32)
        self.packetParticipantStatsInfo = PacketParticipantStatsinfo()
    }
    
    ///
    /// Decode ParticipantStatsInfo
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= 32 else {
           throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<32)
        guard data.count > 32 else {
            return
        }
        data = data.advanced(by: 32)
        try self.packetParticipantStatsInfo.decode(data: &self.bytes)
    }
    
    ///
    /// Returns participantStatsInfo
    ///
    /// - returns:
    ///   - participantStatsInfo: participant Stats Info
    ///
    
    override func participantStatsInfo() throws -> PacketParticipantStatsinfo {
        return self.packetParticipantStatsInfo
    }
}

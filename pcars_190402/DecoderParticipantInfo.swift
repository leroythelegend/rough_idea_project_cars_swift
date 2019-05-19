//
//  DecoderParticipantInfo.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder Participant Info
///

class DecoderParticipantInfo : Decoder {

    private var bytes : Data
    private var packetParticipantInfo : PacketParticipantInfo
  
    ///
    /// DecoderParticipantInfo init
    ///
    
    override init() {
        self.bytes = Data(count: 32)
        self.packetParticipantInfo = PacketParticipantInfo()
    }

    ///
    /// Decode ParticipantInfo
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
        
        try packetParticipantInfo.decode(data: &self.bytes)
    }

    ///
    /// Returns ParticipantInfo
    ///
    /// - returns:
    ///   - ParticipantInfo: Participant Info
    ///
    
    override func participantInfo() throws -> PacketParticipantInfo {
        return self.packetParticipantInfo
    }
}

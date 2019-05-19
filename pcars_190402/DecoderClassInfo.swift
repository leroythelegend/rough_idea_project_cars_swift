//
//  DecoderClassInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

///
/// Decoder Class Info
///

class DecoderClassInfo : Decoder {
    
    private var bytes : Data
    private var packetClassInfo : PacketClassInfo
    
    ///
    /// DecoderClassInfo init
    ///
    
    override init() {
        self.bytes = Data(count: 70)
        self.packetClassInfo = PacketClassInfo()
    }
   
    ///
    /// Decoder ClassInfo
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= 24 else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<24)
        guard data.count > 24 else {
            return
        }
        data = data.advanced(by: 24)
        try self.packetClassInfo.decode(data: &self.bytes)
    }

    ///
    /// Returns PacketClassInfo
    ///
    /// - returns:
    ///   - PacketClassInfo: Packet Class Info
    ///
    
    override func classInfo() throws -> PacketClassInfo {
        return self.packetClassInfo
    }
}

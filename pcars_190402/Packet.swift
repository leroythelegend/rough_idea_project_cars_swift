//
//  Packet.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet
///

class Packet {
    
    private var decoders: Array<Decoder>
    
    ///
    /// Packet init
    ///

    init() {
        self.decoders = Array<Decoder>()
    }
 
    ///
    /// Calls the decode function for all of the decodes
    /// in decoders
    ///
    /// - parameters:
    ///   - data: to be decoded
    ///
    
    func decode(data: inout Data) throws {
        for decode in self.decoders {
            try decode.decode(data: &data)
        }
    }

    ///
    /// Add decoder to decoders
    ///
    /// - parameters:
    ///   - decoder: to be added to decoders
    ///
    
    func addDecoder(_ decoder : Decoder) {
        self.decoders.append(decoder)
    }
}

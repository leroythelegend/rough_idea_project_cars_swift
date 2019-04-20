//
//  Decoder4thBit.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder 4th bit 0000 X000
///

class Decoder4thBit : Decoder {
    
    private var bytes : Data

    ///
    /// Decoder4thBit init
    ///
    
    override init() {
        bytes = Data(count: 1)
    }

    ///
    /// Decode 4th bit
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - important: Does not remove anything
    ///              from the data. Must call
    ///              DecoderIncrement to move
    ///              data along.
    /// - throws: Out of range
    ///

    override func decode(data: inout Data) throws {
        guard data.count >= 1 else {
            throw PCarsUDPError.outOfRange
        }
        bytes = data.subdata(in: 0..<1)
    }
    
    ///
    /// Returns UInt
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///
    
    override func uint() -> UInt {
        return UInt((bytes[0] & 8) >> 3)
    }

    ///
    /// Returns bool
    ///
    /// - returns:
    ///   - Bool: boolean
    ///
    
    override func bool() -> Bool {
        return ((bytes[0] & 8) == 8)
    }
}

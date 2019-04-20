//
//  Decoder4LSBits.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decode 4 LSBits 0000 XXXX
///

class Decoder4LSBits : Decoder {
    
    private var bytes : Data

    ///
    /// Decoder4LSBits init
    ///

    override init() {
        self.bytes = Data(count: 1)
    }

    /// Decode 4 Least Significant Bits
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
        self.bytes = data.subdata(in: 0..<1)
    }

    ///
    /// Returns bytes as unsigned int
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///

    override func uint() -> UInt {
        return UInt(self.bytes[0] & 15)
    }
}

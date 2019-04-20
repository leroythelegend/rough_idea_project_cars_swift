//
//  Decoder3LSBits.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder Next 2 Most Significant Bits 0000 0XXX
///

class Decoder3LSBits : Decoder {
    
    private var bytes : Data
   
    ///
    /// Decoder3LSBits init
    ///
    
    override init() {
        bytes = Data(count: 1)
    }

    ///
    /// Decode Next 2 Most Significant Bits
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
    /// Returns unsigned int
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///

    override func uint() -> UInt {        
        return UInt(bytes[0] & 7)
    }
}

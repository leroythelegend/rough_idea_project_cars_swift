//
//  DecoderMSBit.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decode Most Significant Bit X000 0000
///

class DecoderMSBit : Decoder {
    
    private var bytes : Data
 
    ///
    /// DecoderMSBit init
    ///
    
    override init() {
        self.bytes = Data(count: 1)
    }

    ///
    /// Decode Most Significant Bit
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
    /// Returns UInt
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///
    
    override func uint() -> UInt {
        return UInt((self.bytes[0] & 128) >> 7)
    }

    ///
    /// Returns bool
    ///
    /// - returns:
    ///   - Bool: bool
    ///
    
    override func bool() -> Bool {
        return ((self.bytes[0] & 128) == 128)
    }
}


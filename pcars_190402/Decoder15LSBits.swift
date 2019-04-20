//
//  Decoder15LSBits.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder 15 Least Significant Bits 0XXX XXXX XXXX XXXX
///

class Decoder15LSBits : Decoder {
    
    private var bytes : Data
    
    ///
    /// Decoder15LSBits init
    ///
    
    override init() {
        self.bytes = Data(count: 2)
    }
    
    ///
    /// Decode Next 15 Least Significant Bits
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
        guard data.count >= 2 else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<2)
    }
  
    ///
    /// Returns UInt
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value |= UInt(self.bytes[1]) << 8
        value |= UInt(self.bytes[0] & 127)
        
        return value
    }
}

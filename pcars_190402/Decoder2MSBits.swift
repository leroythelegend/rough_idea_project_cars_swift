//
//  Decoder2MSBits.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder 2 Most Significant Bits XX00 0000
///

class Decoder2MSBits : Decoder {
    
    private var bytes : Data
  
    ///
    /// Decoder2MSBits init
    ///
    
    override init() {
        bytes = Data(count: 1)
    }

    ///
    /// Decode 2 Most Significant Bits
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - important: Does not remove anything
    ///              from the data. Must call
    ///              DecoderIncrement to move
    ///              data along.
    ///

    override func decode(data: inout Data) {
        guard data.count >= 1 else {
            self.bytes = Data(repeating: 0xFF, count: 1)
            return
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
        return UInt((bytes[0] & 192) >> 6)
    }
}

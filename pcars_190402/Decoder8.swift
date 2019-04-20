//
//  Decoder8.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decode 1 byte (8 bits)
///

class Decoder8 : Decoder {
    
    private var bytes: Data
    private let size: Int = 1
   
    ///
    /// Decoder8 init
    ///

    override init() {
        self.bytes = Data(count: size)
    }
  
    ///
    /// Decode 1 byte in to bytes
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - important: Does the parameter need to be inout
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= size else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<size)
        guard data.count > size else {
            return
        }
        data = data.advanced(by: size)
    }
 
    ///
    /// Returns bytes as unsigned int
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///

    override func uint() -> UInt {
        return UInt(self.bytes[0])
    }
 
    ///
    /// Returns signed int
    ///
    /// - returns:
    ///   - Int: signed int
    ///

    override func int() -> Int {
        let value : Int8 = Int8(bitPattern : self.bytes[0])
        return Int(value)
    }
}

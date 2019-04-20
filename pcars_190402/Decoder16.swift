//
//  Decoder16.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decode 2 bytes (16 bits)
///

class Decoder16 : Decoder {
    
    private var bytes: Data
    private let size: Int = 2
 
    ///
    /// Decoder16 init
    ///
    
    override init() {
        self.bytes = Data(count: size)
    }

    /// Decode 2 bytes in to bytes
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
        var value : UInt = 0
        
        value |= UInt(self.bytes[1]) << 8
        value |= UInt(self.bytes[0])
        
        return value
    }
    
    ///
    /// Returns signed int
    ///
    /// - returns:
    ///   - Int: signed int
    ///

    override func int() -> Int {
        var value : Int16 = 0
        
        value |= Int16(self.bytes[1]) << 8
        value |= Int16(self.bytes[0])
        
        return Int(value)
    }
}

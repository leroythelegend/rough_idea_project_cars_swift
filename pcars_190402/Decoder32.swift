//
//  Decoder32.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decode 4 bytes (32 bits)
///

class Decoder32 : Decoder {
    
    private var bytes : Data
 
    ///
    /// Decoder32 init
    ///
    
    override init() {
        self.bytes = Data(count: 4)
    }
 
    ///
    /// Decode 4 bytes in to bytes
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - important: Does the parameter need to be inout
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= 4 else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<4)
        
        guard data.count > 4 else {
            return
        }
        data = data.advanced(by: 4)
    }
 
    ///
    /// Returns bytes as unsigned int
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///

    override func uint() -> UInt {
        var value : UInt = 0
        
        value |= UInt(self.bytes[3]) << 24
        value |= UInt(self.bytes[2]) << 16
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
        var value : Int32 = 0
        
        value |= Int32(self.bytes[3]) << 24
        value |= Int32(self.bytes[2]) << 16
        value |= Int32(self.bytes[1]) << 8
        value |= Int32(self.bytes[0])
        
        return Int(value)
    }

    ///
    /// Returns bytes as float
    ///
    /// - returns:
    ///   - Float: float
    ///

    override func float() -> Float {
        var value : UInt32 = 0
        
        value |= UInt32(self.bytes[3]) << 24
        value |= UInt32(self.bytes[2]) << 16
        value |= UInt32(self.bytes[1]) << 8
        value |= UInt32(self.bytes[0])
        
        return Float(bitPattern: value)
    }
}

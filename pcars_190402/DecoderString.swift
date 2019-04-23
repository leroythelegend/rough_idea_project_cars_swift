//
//  DecoderString.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder String
///

class DecoderString : Decoder {
    
    private var bytes : Data
    private var length : Int
    
    ///
    /// DecoderString init
    ///
    
    init(length: Int) {
        self.bytes = Data(count: length)
        self.length = length
    }
    
    ///
    /// Decode String
    ///
    /// - parameters:
    ///   - data: to be decoded
    /// - throws: Out of range
    ///
    
    override func decode(data: inout Data) throws {
        guard data.count >= self.length else {
            throw PCarsUDPError.outOfRange
        }
        self.bytes = data.subdata(in: 0..<self.length)
        guard data.count > self.length else {
            return
        }
        data = data.advanced(by: self.length)
    }
    
    ///
    /// Returns String
    ///
    /// - returns:
    ///   - string: String
    ///
    
    override func string() -> String? {
        let str = String(data: self.bytes, encoding: .ascii)!
        let terminateIndex = str.firstIndex(of: "\0") ?? str.endIndex
        let name = str[..<terminateIndex]
        return String(name)
    }
}

//
//  Decoder15LSBits.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Decoder15LSBits : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 2)
    }
    
    override func decode(data: inout Data) {
        guard data.count >= 2 else {
            self.bytes = Data(repeating: 0xFF, count: 2)
            return
        }
        bytes = data.subdata(in: 0..<2)
    }
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value |= UInt(bytes[1]) << 8
        value |= UInt(bytes[0] & 127)
        
        return value
    }
}

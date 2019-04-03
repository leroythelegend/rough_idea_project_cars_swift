//
//  Decoder32.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Decoder32 : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 4)
    }
    
    override func decode(data: inout Data) {
        bytes = data.subdata(in: 0..<4)
        data = data.advanced(by: 4)
    }
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value |= UInt(bytes[3]) << 24
        value |= UInt(bytes[2]) << 16
        value |= UInt(bytes[1]) << 8
        value |= UInt(bytes[0])
        
        return value
    }
}

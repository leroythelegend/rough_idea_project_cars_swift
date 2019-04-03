//
//  Decoder4MSBits.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Decoder4MSBits : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 1)
    }
    
    override func decode(data: inout Data) {
        bytes = data.subdata(in: 0..<1)
    }
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value = UInt((bytes[0] & 240) >> 4)
        
        return value
    }
}

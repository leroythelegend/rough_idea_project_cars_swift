//
//  Decoder16.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Decoder16 : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 2)
    }
    
    override func decode(data: inout Data) {
        bytes = data.subdata(in: 0..<2)
        data = data.advanced(by: 2)
    }
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value |= UInt(bytes[1]) << 8
        value |= UInt(bytes[0])
        
        return value
    }
}

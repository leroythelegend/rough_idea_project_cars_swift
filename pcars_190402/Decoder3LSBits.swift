//
//  Decoder3LSBits.swift
//  pcars_190402
//
//  Created by Leroy on 10/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

class Decoder3LSBits : Decoder {
    
    private var bytes : Data
    
    override init() {
        bytes = Data(count: 1)
    }
    
    override func decode(data: inout Data) {
        guard data.count >= 1 else {
            self.bytes = Data(repeating: 0xFF, count: 1)
            return
        }
        bytes = data.subdata(in: 0..<1)
    }
    
    override func uint() -> UInt {
        var value : UInt = 0
        
        value = UInt(bytes[0] & 7)
        
        return value
    }
}

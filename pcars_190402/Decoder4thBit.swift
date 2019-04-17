//
//  Decoder4thBit.swift
//  pcars_190402
//
//  Created by Leigh McLean on 10/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Decoder4thBit : Decoder {
    
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
    
    override func bool() -> Bool {
        return ((bytes[0] & 8) == 8)
    }
}

//
//  DecoderString.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class DecoderString : Decoder {
    
    private var bytes : Data
    private var length : Int
    
    init(length: Int) {
        self.bytes = Data(count: length)
        self.length = length
    }
    
    override func decode(data: inout Data) {
        guard data.count >= self.length else {
            self.bytes = Data(repeating: 0xFF, count: self.length)
            return
        }
        bytes = data.subdata(in: 0..<self.length)
        guard data.count != self.length else {
            return
        }
        data = data.advanced(by: self.length)
    }
    
    override func string() -> String? {
        return String(data: self.bytes, encoding: .utf8)
    }
}

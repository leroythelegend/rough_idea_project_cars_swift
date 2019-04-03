//
//  Packet.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class Packet : Decoder {
    
    private var decoders : Array<Decoder>
    
    override init() {
        decoders = Array<Decoder>()
    }
    
    override func decode(data: inout Data) {
        for decode in decoders {
            decode.decode(data: &data)
        }
    }
    
    func add(decoder : inout Decoder) {
        decoders.append(decoder)
    }
}

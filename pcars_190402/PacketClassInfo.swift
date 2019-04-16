//
//  PacketClassInfo.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketClassInfo  : Packet {
    
    var classIndex : Decoder
    var name : Decoder
    
    override init() {
        
        self.classIndex = Decoder32()
        self.name = DecoderString(length: 20)
        
        super.init()
     
        super.addDecoder(self.classIndex)
        super.addDecoder(self.name)
    }
}




//
//  PacketParticipantsData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class PacketParticipantsData  : Packet {
    
    var participantsChangedTimestamp : Decoder
    var names : Array<Decoder>
    var nationalities : Array<Decoder>
    var indexs : Array<Decoder>
    
    override init() {
        
        self.participantsChangedTimestamp = Decoder32()
        self.names = Array(repeating: DecoderString(length: 64), count: 16)
        self.nationalities = Array(repeating: Decoder32(), count: 16)
        self.indexs = Array(repeating: Decoder16(), count: 16)

        super.init()
        
        super.addDecoder(self.participantsChangedTimestamp)
        for name in self.names {
            super.addDecoder(name)
        }
        for nationality in self.nationalities {
            super.addDecoder(nationality)
        }
        for index in self.indexs {
            super.addDecoder(index)
        }
    }
}

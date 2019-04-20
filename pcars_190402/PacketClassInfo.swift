//
//  PacketClassInfo.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Class Info
///
///    struct sClassInfo
///    {
///        unsigned int sClassIndex; // 0 4
///        char         sName[CLASS_NAME_LENGTH_MAX]; // 4 24
///    };
///

class PacketClassInfo  : Packet {
    
    var classIndex : Decoder
    var name : Decoder
    
    ///
    /// PacketClassInfo init
    ///
    
    override init() {
        
        self.classIndex = Decoder32()
        self.name = DecoderString(length: 20)
        
        super.init()
     
        super.addDecoder(self.classIndex)
        super.addDecoder(self.name)
    }
}




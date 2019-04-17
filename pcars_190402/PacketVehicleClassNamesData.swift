//
//  PacketVehicleClassNamesData.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation


class PacketVehicleClassNamesData  : Packet {
    
    var classInfos: Array<Decoder>
    
    override init() {
        
        self.classInfos = Array(repeating: DecoderClassInfo(), count: 60)
        
        super.init()
        
        for classInfo in classInfos {
            super.addDecoder(classInfo)
        }
    }
}

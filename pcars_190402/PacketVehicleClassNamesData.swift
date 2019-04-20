//
//  PacketVehicleClassNamesData.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Vehicle Class Names Data
///
///
///    struct sVehicleClassNamesData
///    {
///        static const unsigned int    sPacketSize = 1452;
///        PacketBase                    sBase; // 0 12
///        sClassInfo                    sClasses[CLASSES_SUPPORTED_PER_PACKET]; //12 24*60
///    };
///

class PacketVehicleClassNamesData  : Packet {
    
    var classInfos: Array<Decoder>
    
    ///
    /// PacketVehicleClassNamesData init
    ///
    
    override init() {
        
        self.classInfos = Array<Decoder>()
        
        for _ in 1...60 {
            self.classInfos.append(DecoderClassInfo())
        }
        
        super.init()
        
        for classInfo in self.classInfos {
            super.addDecoder(classInfo)
        }
    }
}

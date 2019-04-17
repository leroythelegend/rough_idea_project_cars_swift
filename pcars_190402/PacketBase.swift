//
//  PacketBase.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet base
///
/// struct PacketBase
/// {
///     unsigned int    mPacketNumber;         //0 counter reflecting all the packets that have been sent during the game run
///     unsigned int    mCategoryPacketNumber; //4 counter of the packet groups belonging to the given category
///     unsigned char    mPartialPacketIndex;  //8 If the data from this class had to be sent in several packets, the index number
///     unsigned char    mPartialPacketNumber; //9 If the data from this class had to be sent in several packets, the total number
///     unsigned char    mPacketType;          //10 what is the type of this packet (see EUDPStreamerPacketHanlderType for details)
///     unsigned char    mPacketVersion;       //11 what is the version of protocol for this handler, to be bumped with data structure change
/// }; //12 total size
///

class PacketBase  : Packet {
    
    var packetNumber : Decoder
    var categoryPacketNumber : Decoder
    var partialPacketIndex : Decoder
    var partialPacketNumber : Decoder
    var packetType : Decoder
    var packetVersion : Decoder

    ///
    /// PacketBase init
    ///
    
    override init() {
    
        self.packetNumber = Decoder32()
        self.categoryPacketNumber = Decoder32()
        self.partialPacketIndex = Decoder8()
        self.partialPacketNumber = Decoder8()
        self.packetType = Decoder8()
        self.packetVersion = Decoder8()
        
        super.init()
        
        super.addDecoder(self.packetNumber)
        super.addDecoder(self.categoryPacketNumber)
        super.addDecoder(self.partialPacketIndex)
        super.addDecoder(self.partialPacketNumber)
        super.addDecoder(self.packetType)
        super.addDecoder(self.packetVersion)
    }
}

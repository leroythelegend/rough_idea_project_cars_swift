//
//  Decoder.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder base class
///

class Decoder {
    
    ///
    /// Calls the decode on the data
    ///
    /// - parameters:
    ///   - data: to be decoded
    ///

    func decode(data: inout Data) {}

    ///
    /// Returns unsigned int
    ///
    /// - returns:
    ///   - UInt: unsigned int
    ///

    func uint() -> UInt {
        return 0
    }
 
    ///
    /// Returns signed int
    ///
    /// - returns:
    ///   - Int: signed int
    ///

    func int() -> Int {
        return 0
    }

    ///
    /// Returns float
    ///
    /// - returns:
    ///   - Float: float
    ///
    
    func float() -> Float {
        return 0;
    }
 
    ///
    /// Returns bool
    ///
    /// - returns:
    ///   - Bool: bool
    ///
    
    func bool() -> Bool {
        return false
    }

    ///
    /// Returns PacketParticipantInfo
    ///
    /// - returns:
    ///   - PacketParticipantInfo: packetParticipantInfo
    ///
    
    func participantInfo() -> PacketParticipantInfo {
        return PacketParticipantInfo()
    }
 
    ///
    /// Returns PacketParticipantStatsinfo
    ///
    /// - returns:
    ///   - PacketParticipantStatsinfo: packetParticipantStatsinfo
    ///
    
    func participantStatsInfo() -> PacketParticipantStatsinfo {
        return PacketParticipantStatsinfo()
    }

    ///
    /// Returns PacketVehicleInfo
    ///
    /// - returns:
    ///   - PacketVehicleInfo: packetVehicleInfo
    ///
    
    func packetVehicleInfo() -> PacketVehicleInfo {
        return PacketVehicleInfo()
    }
 
    ///
    /// Returns PacketClassInfo
    ///
    /// - returns:
    ///   - PacketClassInfo: packetClassInfo
    ///

    func packetClassInfo() -> PacketClassInfo {
        return PacketClassInfo()
    }

    ///
    /// Returns String
    ///
    /// - returns:
    ///   - String: optional string
    ///
    
    func string() -> String? {
        return String()
    }
}

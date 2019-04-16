//
//  TelemetryV2.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy All rights reserved.
//

import Foundation

///
/// TelemetryV2 protocol
///

class TelemetryV2 : Telemetry {

    var packetGameStateData : PacketGameStateData
    var packetTelemetryData : PacketTelemetryData
    var udp : ReaderUDP?
    
    ///
    /// Telemetry Version 2 init
    ///
    
    init() throws {
        self.packetGameStateData = PacketGameStateData()
        self.packetTelemetryData = PacketTelemetryData()

        self.udp = try ReaderUDP(port: "5606")
    }

    ///
    /// read
    ///
    /// - parameters:
    ///   - completion: Completion Handler with PCar Version 2 Packets
    ///

    func read(completion: @escaping ((_ packets: Packets) -> Void)) {
     
        var packet : Packets
        packet = .error(false)
        packet = .isEmpty(false)
        packet = .unknownPacket(false)

        guard let _ = udp else {
            packet = .error(true)
            completion(packet)
            return
        }

        var data = self.udp?.read(amount: 1500)
   
        if data?.isEmpty != true {
            let packetbase : PacketBase = PacketBase()
        
            packetbase.decode(data: &data!)
        
            if packetbase.packetType.uint() == 4 && data!.count == 12 {
                self.packetGameStateData.decode(data: &data!)
                packet = .gameStateData(gameState: self.packetGameStateData)
            }
            else if packetbase.packetType.uint() == 0 && data!.count == 547 {
                self.packetTelemetryData.decode(data: &data!)
                packet = .telemetryData(telemetry: self.packetTelemetryData)
            }
            else {
                packet = .unknownPacket(true)
            }
        }
        else {
            packet  = .isEmpty(true)
        }
        completion(packet)
    }
}

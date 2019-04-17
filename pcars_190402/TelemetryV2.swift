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

    func read(completion: @escaping ((_ packets: Packets?) -> Void)) {

        guard let _ = udp else {
            completion(nil)
            return
        }
   
        // read data from pcars
        if var data = self.udp?.read(amount: 1500) {
            let packetbase : PacketBase = PacketBase()
        
            // decode packetbase to find out what type of packet we have
            packetbase.decode(data: &data)

            // if found add packet to completion handler
            if packetbase.packetType.uint() == 4 && data.count == 12 { // GameStateData
                self.packetGameStateData.decode(data: &data)
                completion(.gameStateData(gameState: self.packetGameStateData))
            }
            else if packetbase.packetType.uint() == 0 && data.count == 547 { // TelemetryData
                self.packetTelemetryData.decode(data: &data)
                completion(.telemetryData(telemetry: self.packetTelemetryData))
            }
            else { // unknown
                completion(nil)
            }
        }
        else {
            completion(nil)
        }
    }
}

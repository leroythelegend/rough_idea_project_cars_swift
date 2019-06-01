//
//  TelemetryV2.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy All rights reserved.
//

import Foundation

///
/// TelemetryV1 protocol
///

class TelemetryV1 : Telemetry {
    
    private var udp : ReaderUDP?
    
    ///
    /// Telemetry Version 1 init
    ///
    
    init() throws {
        self.udp = try ReaderUDP(port: "5606")
    }
    
    ///
    /// read
    ///
    /// - parameters:
    ///   - completion: Completion Handler with PCar Version 1 Packets
    ///
    
    func read(completion: @escaping ((_ packets: Packets?) -> Void)) throws {
        
        guard let _ = udp else {
            completion(nil)
            return
        }
        
        // read data from pcars
        if var data = self.udp?.read(amount: 1500) {
            let packetGeneric : PacketGeneric = PacketGeneric()
            
            // decode packetbase to find out what type of packet we have
            try packetGeneric.decode(data: &data)
            
            // if found add packet to completion handler
            if packetGeneric.packetType.uint() == 1 && data.count == 1344 { // ParticipantInfoStrings
                let packetParticipantInfoStrings : PacketParticipantInfoStrings = PacketParticipantInfoStrings()
                try packetParticipantInfoStrings.decode(data: &data)
                completion(.participantInfoStringsData(participantInfoStrings: packetParticipantInfoStrings))
            }
            else if packetGeneric.packetType.uint() == 2 && data.count == 1025 { // ParticipantInfoStrings
                let participantInfoStringsAdditional : ParticipantInfoStringsAdditional = ParticipantInfoStringsAdditional()
                try participantInfoStringsAdditional.decode(data: &data)
                completion(.participantInfoStringsAdditionalData(participantInfoStringsAdditional: participantInfoStringsAdditional))
            }
            else if packetGeneric.packetType.uint() == 0 && data.count == 1364 {
                let telemetryDataV1 : PacketTelemetryDataV1 = PacketTelemetryDataV1()
                try telemetryDataV1.decode(data: &data)
                completion(.telemetryDataV1(telemetryV1: telemetryDataV1))
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

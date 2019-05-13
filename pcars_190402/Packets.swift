//
//  Packets.swift
//  pcars_190402
//
//  Created by Leroy on 14/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packets
///

enum  Packets {
    case telemetryData(telemetry: PacketTelemetryData)
    case raceData(race: PacketRaceData)
    case participantsData(participant: PacketParticipantsData)
    case timingsData(timings: PacketTimingsData)
    case gameStateData(gameState: PacketGameStateData)
    case timeStatsData(timeStats: PacketTimeStatsData)
    case vehicleNamesData(vehicleNames: PacketParticipantVehicleNamesData)
    case vehicleClassNamesData(classNames: PacketVehicleClassNamesData)
    case participantInfoStringsData(participantInfoStrings: PacketParticipantInfoStrings)
    case participantInfoStringsAdditionalData(participantInfoStringsAdditional: ParticipantInfoStringsAdditional)
    case telemetryDataV1(telemetryV1: PacketTelemetryDataV1)
}


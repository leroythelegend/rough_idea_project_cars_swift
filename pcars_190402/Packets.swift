//
//  Packets.swift
//  pcars_190402
//
//  Created by Leigh McLean on 14/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

enum  Packets {
    case telemetryData(telemetry: PacketTelemetryData)
    case raceData(PacketRaceData)
    case participantsData(PacketParticipantsData)
    case timingsData(PacketTimingsData)
    case gameStateData(gameState: PacketGameStateData)
    case timeStatsData(PacketTimeStatsData)
    case vehicleNamesData(PacketParticipantVehicleNamesData)
    case vehicleClassNamesData(PacketVehicleClassNamesData)
    case error(Bool)
    case isEmpty(Bool)
    case unknownPacket(Bool)
}


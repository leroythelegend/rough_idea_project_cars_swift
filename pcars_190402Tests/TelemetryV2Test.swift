//
//  TelemetryV2Test.swift
//  pcars_190402Tests
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import XCTest

class TelemetryV2Test: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //let telemetry : TelemetryV2 = TelemetryV2()
        //telemetry.start(process: nil);

        do {
            let telemetry : TelemetryV2 = try TelemetryV2()
            
            func packets(_ packet: Packets?) -> Void {
                
                switch packet {
                case let .gameStateData(gameState: packetGameStateData)?:
                    print("buildVersionNumber \(packetGameStateData.buildVersionNumber.uint())")
                    print("gameState          \(packetGameStateData.gameState.uint())")
                    print("sessionState       \(packetGameStateData.sessionState.uint())")
                    print("ambientTemperature \(packetGameStateData.ambientTemperature.int())")
                    print("trackTemperature   \(packetGameStateData.trackTemperature.int())")
                    print("rainDensity        \(packetGameStateData.rainDensity.uint())")
                    print("snowDensity        \(packetGameStateData.snowDensity.uint())")
                    print("windSpeed          \(packetGameStateData.windSpeed.int())")
                    print("windDirectionX     \(packetGameStateData.windDirectionX.int())")
                    print("windDirectionY     \(packetGameStateData.windDirectionY.int())")
                case let .telemetryData(telemetry: packetTelemetryData)?:
                    print("unfilteredThrottle     \(packetTelemetryData.unfilteredThrottle.uint())")
                    print("unfilteredBrake        \(packetTelemetryData.unfilteredBrake.uint())")
                    print("unfilteredSteering     \(packetTelemetryData.unfilteredSteering.int())")
                    print("unfilteredClutch       \(packetTelemetryData.unfilteredClutch.uint())")
                    print("carFlags               \(packetTelemetryData.carFlags.uint())")
                    print("oilTempCelsius         \(packetTelemetryData.oilTempCelsius.int())")
                    print("oilPressureKPa         \(packetTelemetryData.oilPressureKPa.uint())")
                    print("waterTempCelsius       \(packetTelemetryData.waterTempCelsius.int())")
                    print("waterPressureKpa       \(packetTelemetryData.waterPressureKpa.uint())")
                    print("fuelPressureKpa        \(packetTelemetryData.fuelPressureKpa.uint())")
                    print("fuelCapacity           \(packetTelemetryData.fuelCapacity.uint())")
                    print("brake                  \(packetTelemetryData.brake.uint())")
                    print("clutch                 \(packetTelemetryData.clutch.uint())")
                    print("fuelLevel              \(packetTelemetryData.fuelLevel.float())")
                    print("speed                  \(packetTelemetryData.speed.float())")
                    print("rpm                    \(packetTelemetryData.rpm.uint())")
                    print("maxRpm                 \(packetTelemetryData.maxRpm.uint())")
                    print("viewedParticipantIndex \(packetTelemetryData.viewedParticipantIndex.int())")
                    print("throttle               \(packetTelemetryData.throttle.uint())")
                    print("steering               \(packetTelemetryData.steering.int())")
                    print("gear                   \(packetTelemetryData.gear.uint())")
                    print("numGears               \(packetTelemetryData.numGears.uint())")
                    print("boostAmount            \(packetTelemetryData.boostAmount.uint())")
                    print("crashState             \(packetTelemetryData.crashState.uint())")
                    print("odometerKM             \(packetTelemetryData.odometerKM.float())")
                    for (index, orientation) in packetTelemetryData.orientations.enumerated() {
                        print("orientation_\(index) \(orientation.float())")
                    }
                    for (index, localVelocity) in packetTelemetryData.localVelocities.enumerated() {
                        print("localVelocity_\(index) \(localVelocity.float())")
                    }
                    for (index, worldVelocity) in packetTelemetryData.worldVelocities.enumerated() {
                        print("worldVelocity_\(index) \(worldVelocity.float())")
                    }
                    for (index, angularVelocity) in packetTelemetryData.angularVelocities.enumerated() {
                        print("angularVelocity_\(index) \(angularVelocity.float())")
                    }
                    for (index, localAcceleration) in packetTelemetryData.localAccelerations.enumerated() {
                        print("localAcceleration_\(index) \(localAcceleration.float())")
                    }
                    for (index, worldAcceleration) in packetTelemetryData.worldAccelerations.enumerated() {
                        print("worldAcceleration_\(index) \(worldAcceleration.float())")
                    }
                    for (index, extentsCentre) in packetTelemetryData.extentsCentres.enumerated() {
                        print("extentsCentre_\(index) \(extentsCentre.float())")
                    }
                    for (index, tyreFlag) in packetTelemetryData.tyreFlags.enumerated() {
                        print("tyreFlag_\(index) \(tyreFlag.uint())")
                    }
                    for (index, terrain) in packetTelemetryData.terrains.enumerated() {
                        print("terrain_\(index) \(terrain.uint())")
                    }
                    for (index, tyreY) in packetTelemetryData.tyreYs.enumerated() {
                        print("tyreY_\(index) \(tyreY.float())")
                    }
                    for (index, tyreRPS) in packetTelemetryData.tyreRPSs.enumerated() {
                        print("tyreRPS_\(index) \(tyreRPS.float())")
                    }
                    for (index, tyreTemp) in packetTelemetryData.tyreTemps.enumerated() {
                        print("tyreTenp_\(index) \(tyreTemp.uint())")
                    }
                    for (index, tyreHeightAboveGround) in packetTelemetryData.tyreHeightsAboveGround.enumerated() {
                        print("tyreHeightAboveGround_\(index) \(tyreHeightAboveGround.float())")
                    }
                    for (index, tyreWear) in packetTelemetryData.tyreWears.enumerated() {
                        print("tyreWear_\(index) \(tyreWear.uint())")
                    }
                    for (index, brakeDamage) in packetTelemetryData.brakeDamages.enumerated() {
                        print("brakeDamage_\(index) \(brakeDamage.uint())")
                    }
                    for (index, suspensionDamage) in packetTelemetryData.suspensionDamages.enumerated() {
                        print("suspensionDamage_\(index) \(suspensionDamage.uint())")
                    }
                    for (index, brakeTempCelsus) in packetTelemetryData.brakeTempsCelsius.enumerated() {
                        print("brakeTempCelsus_\(index) \(brakeTempCelsus.int())")
                    }
                    for (index, tyreTreadTemp) in packetTelemetryData.tyreTreadTemps.enumerated() {
                        print("tyreTreadTemp_\(index) \(tyreTreadTemp.uint())")
                    }
                    for (index, tyreLayerTemp) in packetTelemetryData.tyreLayerTemps.enumerated() {
                        print("tyreLayerTemp_\(index) \(tyreLayerTemp.uint())")
                    }
                    for (index, tyreCarcassTemp) in packetTelemetryData.tyreCarcassTemps.enumerated() {
                        print("tyreCarcassTemp_\(index) \(tyreCarcassTemp.uint())")
                    }
                    for (index, tyreRimTemp) in packetTelemetryData.tyreRimTemps.enumerated() {
                        print("tyreRimTemp_\(index) \(tyreRimTemp.uint())")
                    }
                    for (index, tyreInternalAirTemp) in packetTelemetryData.tyreInternalAirTemps.enumerated() {
                        print("tyreInternalAirTemp_\(index) \(tyreInternalAirTemp.uint())")
                    }
                    for (index, tyreTempLeft) in packetTelemetryData.tyreTempsLeft.enumerated() {
                        print("tyreTempLeft_\(index) \(tyreTempLeft.uint())")
                    }
                    for (index, tyreTempCentre) in packetTelemetryData.tyreTempsCentre.enumerated() {
                        print("tyreTempCentre_\(index) \(tyreTempCentre.uint())")
                    }
                    for (index, tyreTempRight) in packetTelemetryData.tyreTempsRight.enumerated() {
                        print("tyreTempRight_\(index) \(tyreTempRight.uint())")
                    }
                    for (index, wheelLocalPositionY) in packetTelemetryData.wheelLocalPositionsY.enumerated() {
                        print("wheelLocalPositionY_\(index) \(wheelLocalPositionY.float())")
                    }
                    for (index, rideHeight) in packetTelemetryData.rideHeights.enumerated() {
                        print("rideHeoght_\(index) \(rideHeight.float())")
                    }
                    for (index, suspensionTravel) in packetTelemetryData.suspensionTravels.enumerated() {
                        print("suspensionTravel_\(index) \(suspensionTravel.float())")
                    }
                    for (index, suspensionVelocity) in packetTelemetryData.suspensionVelocities.enumerated() {
                        print("suspensionVelocity_\(index) \(suspensionVelocity.float())")
                    }
                    for (index, suspensionRideHeight) in packetTelemetryData.suspensionRideHeights.enumerated() {
                        print("suspensionRideHeight_\(index) \(suspensionRideHeight.uint())")
                    }
                    for (index, suspensionRideHeight) in packetTelemetryData.suspensionRideHeights.enumerated() {
                        print("suspensionRideHeight_\(index) \(suspensionRideHeight.uint())")
                    }
                    for (index, airPressure) in packetTelemetryData.airPressures.enumerated() {
                        print("airPressure_\(index) \(airPressure.uint())")
                    }
                    print("engineSpeed              \(packetTelemetryData.engineSpeed.float())")
                    print("engineTorgue             \(packetTelemetryData.engineTorque.float())")
                    for (index, wing) in packetTelemetryData.wings.enumerated() {
                        print("wing_\(index) \(wing.uint())")
                    }
                    print("handbrake                   \(packetTelemetryData.handBrake.uint())")
                    print("aeroDamage                  \(packetTelemetryData.aeroDamage.uint())")
                    print("engineDamage                \(packetTelemetryData.engineDamage.uint())")
                    print("joyPad0                     \(packetTelemetryData.joyPad0.uint())")
                    print("dPad                        \(packetTelemetryData.dPad.uint())")
                    for (index, tyreCompound) in packetTelemetryData.tyreCompounds.enumerated() {
                        guard let compound = tyreCompound.string() else {
                            continue
                        }
                        print("tyreCompound_\(index) " + compound)
                    }
                    print("turboBoostPressure          \(packetTelemetryData.turboBoostPressure.float())")
                    for (index, fullPosition) in packetTelemetryData.fullPositions.enumerated() {
                        print("fullPosition_\(index) \(fullPosition.float())")
                    }
                    print("brakeBias                   \(packetTelemetryData.brakeBias.uint())")
                    print("tickCount                   \(packetTelemetryData.tickCount.uint())")
                case let .timingsData(timings: packetTimingsdata)?:
                    print("numParticipants                   \(packetTimingsdata.numParticipants.uint())")
                    print("participantsChangedTimestamp      \(packetTimingsdata.participantsChangedTimestamp.uint())")
                    print("eventTimeRemaining                \(packetTimingsdata.eventTimeRemaining.float())")
                    print("splitTimeAhead                    \(packetTimingsdata.splitTimeAhead.float())")
                    print("splitTimeBehind                   \(packetTimingsdata.splitTimeBehind.float())")
                    print("splitTime                         \(packetTimingsdata.splitTime.float())")
                    print("localParticipantIndex             \(packetTimingsdata.localParticipantIndex.uint())")
                    print("tickCount                         \(packetTimingsdata.tickCount.uint())")
                    guard let participant = try? packetTimingsdata.partcipants[Int(packetTimingsdata.localParticipantIndex.uint())].participantInfo() else {
                        break
                    }
                    for (index, worldPosition) in participant.worldPositions.enumerated() {
                        print("worldPosition_\(index) \(worldPosition.int())")
                    }
                    for (index, orientation) in participant.orientations.enumerated() {
                        print("orientation_\(index) \(orientation.int())")
                    }
                    print("currentLapDistance                         \(participant.currentLapDistance.uint())")
                    print("racePosition                               \(participant.racePosition.uint())")
                    print("sector                                     \(participant.sector.uint())")
                    print("isActive                                   \(participant.isActive.uint())")
                    print("precisionXPosition                         \(participant.precisionXPosition.uint())")
                    print("precisionZPosition                         \(participant.precisionZPosition.uint())")
                    print("flagReason                                 \(participant.flagReason.uint())")
                    print("flagColour                                 \(participant.flagColour.uint())")
                    print("pitMode                                    \(participant.pitMode.uint())")
                    print("pitSchedule                                \(participant.pitSchedule.uint())")
                    print("carIndex                                   \(participant.carIndex.uint())")
                    print("isLocal                                    \(participant.isLocal.uint())")
                    print("raceState                                  \(participant.raceState.uint())")
                    print("isValidLap                                 \(participant.isValidLap.uint())")
                    print("currentLap                                 \(participant.currentLap.uint())")
                    print("currentTime                                \(participant.currentTime.float())")
                    print("currentSectorTime                          \(participant.currentSectorTime.float())")
                    print("participantIndex                           \(participant.participantIndex.uint())")
                case let .raceData(race: packetRaceData)?:
                    print("worldFastestLapTime                         \(packetRaceData.worldFastestLapTime.float())")
                    print("personalFastestLapTime                      \(packetRaceData.personalFastestLapTime.float())")
                    print("personalFastestSector1Time                  \(packetRaceData.personalFastestSector1Time.float())")
                    print("personalFastestSector2Time                  \(packetRaceData.personalFastestSector2Time.float())")
                    print("personalFastestSector3Time                  \(packetRaceData.personalFastestSector3Time.float())")
                    print("worldFastestSector1Time                     \(packetRaceData.worldFastestSector1Time.float())")
                    print("worldFastestSector2Time                     \(packetRaceData.worldFastestSector2Time.float())")
                    print("worldFastestSector3Time                     \(packetRaceData.worldFastestSector3Time.float())")
                    print("trackLength                                 \(packetRaceData.trackLength.float())")
                    print("isTimedLap                                  \(packetRaceData.isTimedLap.uint())")
                    print("lapsTimeInEvent                             \(packetRaceData.lapsTimeInEvent.uint())")
                    print("enforcedPitStopLap                          \(packetRaceData.enforcedPitStopLap.uint())")
                    guard let location = packetRaceData.trackLocation.string() else {
                        break
                    }
                    print("trackLocation                               " + location)
                    guard let variation = packetRaceData.trackVariation.string() else {
                        break
                    }
                    print("trackVariation                              " + variation)
                    guard let transLocation = packetRaceData.translatedTrackLocation.string() else {
                        break
                    }
                    print("translatedTrackLocation                     " + transLocation)
                    guard let transVariation = packetRaceData.translatedTrackVariation.string() else {
                        break
                    }
                    print("translatedTrackVariation                    " + transVariation)
                case let .participantsData(participant: packetParticipantsData)?:
                    print("participantsChangedTimestamp                  \(packetParticipantsData.participantsChangedTimestamp.uint())")
                    for (index, name) in packetParticipantsData.names.enumerated() {
                        guard let namestr = name.string() else {
                            continue
                        }
                        print("name_\(index) " + namestr)
                    }
                    for (index, nationality) in packetParticipantsData.nationalities.enumerated() {
                        print("nationality_\(index) \(nationality.uint())")
                    }
                    for (index, i) in packetParticipantsData.indexs.enumerated() {
                        print("index_\(index) \(i.uint())")
                    }
                case let .timeStatsData(timeStats: packetTimeStatsData)?:
                    print("participantsChangedTimestamp                  \(packetTimeStatsData.participantsChangedTimestamp.uint())")
                    // Just going to use 0 here need to get local index number from participants packet
                    guard let stats = try? packetTimeStatsData.participantsStats[0].participantStatsInfo() else {
                        break
                    }
                    print("fastestLapTime                         \(stats.fastestLapTime.float())")
                    print("lastLapTime                            \(stats.lastLapTime.float())")
                    print("lastSectorTime                         \(stats.lastSectorTime.float())")
                    print("fastestSector1Time                     \(stats.fastestSector1Time.float())")
                    print("fastestSector2Time                     \(stats.fastestSector2Time.float())")
                    print("fastestSector3Time                     \(stats.fastestSector3Time.float())")
                    print("participantOnlineRep                   \(stats.participantOnlineRep.uint())")
                    print("participantIndex                       \(stats.participantIndex.uint())")
                case let .vehicleNamesData(vehicleNames: packetVehicleNamesData)?:
                    for (index, vehicleName) in packetVehicleNamesData.vehicles.enumerated() {
                        guard let packet = try? vehicleName.packetVehicleInfo() else {
                            continue
                        }
                        guard let nameStr = packet.name.string() else {
                            continue
                        }
                        print("vehicleClass_\(index)      \(packet.vehicleClass.uint())")
                        print("index_\(index)             \(packet.index.uint())")
                        print("vehicleName_\(index) " + nameStr)
                    }
                case let .vehicleClassNamesData(classNames: packetClassNamesData)?:
                    for (index, className) in packetClassNamesData.classInfos.enumerated() {
                        guard let packet = try? className.packetClassInfo() else {
                            continue
                        }
                        guard let nameStr = packet.name.string() else {
                            continue
                        }
                        print("classIndex_\(index)     \(packet.classIndex.uint())")
                        print("className_\(index) " + nameStr)
                    }
                default:
                    break
                }
            }
            
            while true {
                try telemetry.read(completion: packets)
            }
        }
        catch {
            
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

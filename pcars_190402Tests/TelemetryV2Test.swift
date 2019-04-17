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
                    
                    
                    

                    for (index, orientation) in packetTelemetryData.orientations.enumerated() {
                        print("orientation_\(index) \(orientation.float())")
                    }
                default:
                    break
                }
            }
            
            while true {
                telemetry.read(completion: packets)
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

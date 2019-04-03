//
//  TelemetryV2.swift
//  pcars_190402
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

class TelemetryV2 : Telemetry {

    var packetGameStateData : PacketGameStateData
    
    init() {
        packetGameStateData = PacketGameStateData()
    }
    
    //func start(process: Process) {
    func start(process: Process!) {
        do {
            
            let udp = try ReaderUDP(port: "5606")

            // Add Capture here
            
            var i = 2000
            while i != 0 {
                i -= 1
                var data = udp.read(amount: 4096)
                
                // print (data.count)
                
                if !data.isEmpty {
                    let packetbase : PacketBase = PacketBase()
                    
                    packetbase.decode(data: &data)
                    
                    // test code for now
//                    print(packetbase.packetNumber.uint())
//                    print(packetbase.categoryPacketNumber.uint())
//                    print(packetbase.partialPacketIndex.uint())
//                    print(packetbase.partialPacketNumber.uint())
//                    print("packet type \(packetbase.packetType.uint())")
//                    print(packetbase.packetVersion.uint())
//
//                    print("packet count \(data.count)")
                    
                    if packetbase.packetType.uint() == 4 && data.count == 12 {
                        packetGameStateData.decode(data: &data)
                        
                        print(packetGameStateData.buildVersionNumber.uint())
                        
                        let gamestate = packetGameStateData.gameState as? DecoderGameState
                        
                        print(gamestate?.gameState.uint() ?? 0)
                        print(gamestate?.sessionState.uint() ?? 0)
                        
                        print(packetGameStateData.ambientTemperature.int())
                        print(packetGameStateData.trackTemperature.int())
                        print(packetGameStateData.rainDensity.uint())
                        print(packetGameStateData.snowDensity.uint())
                        print(packetGameStateData.windSpeed.int())
                        print(packetGameStateData.windDirectionX.int())
                        print(packetGameStateData.windDirectionY.int())
                    }
                }
                
            }
            
        }
        catch ReaderUDPError.getAddrInfo(let error) {
            print("getaddrinfo error \(error)")
            return
        }
        catch ReaderUDPError.bind(let error) {
            print("bind error \(error)")
            return
        }
        catch ReaderUDPError.socket(let error) {
            print("socket error \(error)")
            return
        }
        catch ReaderUDPError.unknown {
            print("unkown")
            return
        }
        catch {
            print("really unknown")
            return
        }
    }
}


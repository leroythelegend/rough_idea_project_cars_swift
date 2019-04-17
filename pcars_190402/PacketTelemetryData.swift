//
//  PacketTelemetryData.swift
//  pcars_190402
//
//  Created by Leroy on 7/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Packet Telemetry Data
///
///    struct sTelemetryData
///    {
///        static const unsigned int sPacketSize = 559;
///        PacketBase sBase;                            // 0 12
///        // Participant info
///        signed char sViewedParticipantIndex;         // 12 1
///        // Unfiltered input
///        unsigned char sUnfilteredThrottle;           // 13 1
///        unsigned char sUnfilteredBrake;              // 14 1
///        signed char sUnfilteredSteering;             // 15 1
///        unsigned char sUnfilteredClutch;             // 16 1
///        // Car state
///        unsigned char sCarFlags;                     // 17 1
///        signed short sOilTempCelsius;                // 18 2
///        unsigned short sOilPressureKPa;              // 20 2
///        signed short sWaterTempCelsius;              // 22 2
///        unsigned short sWaterPressureKpa;            // 24 2
///        unsigned short sFuelPressureKpa;             // 26 2
///        unsigned char sFuelCapacity;                 // 28 1
///        unsigned char sBrake;                        // 29 1
///        unsigned char sThrottle;                     // 30 1
///        unsigned char sClutch;                       // 31 1
///        float sFuelLevel;                            // 32 4
///        float sSpeed;                                // 36 4
///        unsigned short sRpm;                         // 40 2
///        unsigned short sMaxRpm;                      // 42 2
///        signed char sSteering;                       // 44 1
///        unsigned char sGearNumGears;                 // 45 1
///        unsigned char sBoostAmount;                  // 46 1
///        unsigned char sCrashState;                   // 47 1
///        float sOdometerKM;                           // 48 4
///        float sOrientation[3];                       // 52 12
///        float sLocalVelocity[3];                     // 64 12
///        float sWorldVelocity[3];                     // 76 12
///        float sAngularVelocity[3];                   // 88 12
///        float sLocalAcceleration[3];                 // 100 12
///        float sWorldAcceleration[3];                 // 112 12
///        float sExtentsCentre[3];                     // 124 12
///        unsigned char sTyreFlags[4];                 // 136 4
///        unsigned char sTerrain[4];                   // 140 4
///        float sTyreY[4];                             // 144 16
///        float sTyreRPS[4];                           // 160 16
///        unsigned char sTyreTemp[4];                  // 176 4
///        float sTyreHeightAboveGround[4];             // 180 16
///        unsigned char sTyreWear[4];                  // 196 4
///        unsigned char sBrakeDamage[4];               // 200 4
///        unsigned char sSuspensionDamage[4];          // 204 4
///        signed short sBrakeTempCelsius[4];           // 208 8
///        unsigned short sTyreTreadTemp[4];            // 216 8
///        unsigned short sTyreLayerTemp[4];            // 224 8
///        unsigned short sTyreCarcassTemp[4];          // 232 8
///        unsigned short sTyreRimTemp[4];              // 240 8
///        unsigned short sTyreInternalAirTemp[4];      // 248 8
///        unsigned short sTyreTempLeft[4];             // 256 8
///        unsigned short sTyreTempCenter[4];           // 264 8
///        unsigned short sTyreTempRight[4];            // 272 8
///        float sWheelLocalPositionY[4];               // 280 16
///        float sRideHeight[4];                        // 296 16
///        float sSuspensionTravel[4];                  // 312 16
///        float sSuspensionVelocity[4];                // 328 16
///        unsigned short sSuspensionRideHeight[4];     // 344 8
///        unsigned short sAirPressure[4];              // 352 8
///        float sEngineSpeed;                          // 360 4
///        float sEngineTorque;                         // 364 4
///        unsigned char sWings[2];                     // 368 2
///        unsigned char sHandBrake;                    // 370 1
///        // Car damage
///        unsigned char sAeroDamage;                   // 371 1
///        unsigned char sEngineDamage;                 // 372 1
///        //  HW state
///        unsigned int sJoyPad0;                       // 376 4
///        unsigned char sDPad;                         // 377 1
///        char sTyreCompound[4][TYRE_NAME_LENGTH_MAX]; // 378 160
///        float sTurboBoostPressure;                   // 538 4
///        float sFullPosition[3];                      // 542 12
///        unsigned char sBrakeBias;                    // 554 1 -- quantized brake bias
///        unsigned int sTickCount;                     // 555
///    };

class PacketTelemetryData  : Packet {
    
    var viewedParticipantIndex : Decoder
    var unfilteredThrottle : Decoder
    var unfilteredBrake : Decoder
    var unfilteredSteering : Decoder
    var unfilteredClutch : Decoder
    var carFlags : Decoder
    var oilTempCelsius : Decoder
    var oilPressureKPa : Decoder
    var waterTempCelsius : Decoder
    var waterPressureKpa : Decoder
    var fuelPressureKpa : Decoder
    var fuelCapacity : Decoder
    var brake : Decoder
    var throttle : Decoder
    var clutch : Decoder
    var fuelLevel : Decoder
    var speed : Decoder
    var rpm : Decoder
    var maxRpm : Decoder
    var steering : Decoder
    var gear : Decoder
    var numGears : Decoder
    private var increment : Decoder
    var boostAmount : Decoder
    var crashState : Decoder
    var odometerKM : Decoder
    var orientations : Array<Decoder>
    var localVelocities : Array<Decoder>
    var worldVelocities : Array<Decoder>
    var angularVelocities : Array<Decoder>
    var localAccelerations : Array<Decoder>
    var worldAccelerations : Array<Decoder>
    var extentsCentres : Array<Decoder>
    var tyreFlags : Array<Decoder>
    var terrains : Array<Decoder>
    var tyreYs : Array<Decoder>
    var tyreRPSs : Array<Decoder>
    var tyreTemps : Array<Decoder>
    var tyreHeightsAboveGround : Array<Decoder>
    var tyreWears : Array<Decoder>
    var brakeDamages : Array<Decoder>
    var suspensionDamages : Array<Decoder>
    var brakeTempsCelsius : Array<Decoder>
    var tyreTreadTemps : Array<Decoder>
    var tyreLayerTemps : Array<Decoder>
    var tyreCarcassTemps : Array<Decoder>
    var tyreRimTemps : Array<Decoder>
    var tyreInternalAirTemps : Array<Decoder>
    var tyreTempsLeft : Array<Decoder>
    var tyreTempsCentre : Array<Decoder>
    var tyreTempsRight : Array<Decoder>
    var wheelLocalPositionsY : Array<Decoder>
    var rideHeights : Array<Decoder>
    var suspensionTravels : Array<Decoder>
    var suspensionVelocities : Array<Decoder>
    var suspensionRideHeights : Array<Decoder>
    var airPressures : Array<Decoder>
    var engineSpeed : Decoder
    var engineTorque : Decoder
    var wings : Array<Decoder>
    var handBrake : Decoder
    var aeroDamage : Decoder
    var engineDamage : Decoder
    var joyPad0 : Decoder
    var dPad : Decoder
    var tyreCompounds : Array<Decoder>
    var turboBoostPressure : Decoder
    var fullPositions : Array<Decoder>
    var brakeBias : Decoder
    var tickCount : Decoder

    ///
    /// PacketTelemetryData init
    ///
    
    override init() {
        
        self.viewedParticipantIndex = Decoder8()
        self.unfilteredThrottle = Decoder8()
        self.unfilteredBrake = Decoder8()
        self.unfilteredSteering = Decoder8()
        self.unfilteredClutch = Decoder8()
        self.carFlags = Decoder8()
        self.oilTempCelsius = Decoder16()
        self.oilPressureKPa = Decoder16()
        self.waterTempCelsius = Decoder16()
        self.waterPressureKpa = Decoder16()
        self.fuelPressureKpa = Decoder16()
        self.fuelCapacity = Decoder8()
        self.brake = Decoder8()
        self.throttle = Decoder8()
        self.clutch = Decoder8()
        self.fuelLevel = Decoder32()
        self.speed = Decoder32()
        self.rpm = Decoder16()
        self.maxRpm = Decoder16()
        self.steering = Decoder8()
        self.gear = Decoder4LSBits()
        self.numGears = Decoder4MSBits()
        self.increment = DecoderIncrement(amount: 1)
        self.boostAmount = Decoder8()
        self.crashState = Decoder8()
        self.odometerKM = Decoder32()
        self.orientations = Array(repeating: Decoder32(), count: 3)
        self.localVelocities = Array(repeating: Decoder32(), count: 3)
        self.worldVelocities = Array(repeating: Decoder32(), count: 3)
        self.angularVelocities = Array(repeating: Decoder32(), count: 3)
        self.localAccelerations = Array(repeating: Decoder32(), count: 3)
        self.worldAccelerations = Array(repeating: Decoder32(), count: 3)
        self.extentsCentres = Array(repeating: Decoder32(), count: 3)
        self.tyreFlags = Array(repeating: Decoder8(), count: 4)
        self.terrains = Array(repeating: Decoder8(), count: 4)
        self.tyreYs = Array(repeating: Decoder32(), count: 4)
        self.tyreRPSs = Array(repeating: Decoder32(), count: 4)
        self.tyreTemps = Array(repeating: Decoder8(), count: 4)
        self.tyreHeightsAboveGround = Array(repeating: Decoder32(), count: 4)
        self.tyreWears = Array(repeating: Decoder8(), count: 4)
        self.brakeDamages = Array(repeating: Decoder8(), count: 4)
        self.suspensionDamages = Array(repeating: Decoder8(), count: 4)
        self.brakeTempsCelsius = Array(repeating: Decoder16(), count: 4)
        self.tyreTreadTemps = Array(repeating: Decoder16(), count: 4)
        self.tyreLayerTemps = Array(repeating: Decoder16(), count: 4)
        self.tyreCarcassTemps = Array(repeating: Decoder16(), count: 4)
        self.tyreRimTemps = Array(repeating: Decoder16(), count: 4)
        self.tyreInternalAirTemps = Array(repeating: Decoder16(), count: 4)
        self.tyreTempsLeft = Array(repeating: Decoder16(), count: 4)
        self.tyreTempsCentre = Array(repeating: Decoder16(), count: 4)
        self.tyreTempsRight = Array(repeating: Decoder16(), count: 4)
        self.wheelLocalPositionsY = Array(repeating: Decoder32(), count: 4)
        self.rideHeights = Array(repeating: Decoder32(), count: 4)
        self.suspensionTravels = Array(repeating: Decoder32(), count: 4)
        self.suspensionVelocities = Array(repeating: Decoder32(), count: 4)
        self.suspensionRideHeights = Array(repeating: Decoder16(), count: 4)
        self.airPressures = Array(repeating: Decoder16(), count: 4)
        self.engineSpeed = Decoder32()
        self.engineTorque = Decoder32()
        self.wings = Array(repeating: Decoder8(), count: 2)
        self.handBrake = Decoder8()
        self.aeroDamage = Decoder8()
        self.engineDamage = Decoder8()
        self.joyPad0 = Decoder32()
        self.dPad = Decoder8()
        self.tyreCompounds = Array(repeating: DecoderString(length: 40), count: 4)
        self.turboBoostPressure = Decoder32()
        self.fullPositions = Array(repeating: Decoder32(), count: 3)
        self.brakeBias = Decoder8()
        self.tickCount = Decoder32()

        super.init()
        
        super.addDecoder(self.viewedParticipantIndex)
        super.addDecoder(self.unfilteredThrottle)
        super.addDecoder(self.unfilteredBrake)
        super.addDecoder(self.unfilteredSteering)
        super.addDecoder(self.unfilteredClutch)
        super.addDecoder(self.carFlags)
        super.addDecoder(self.oilTempCelsius)
        super.addDecoder(self.oilPressureKPa)
        super.addDecoder(self.waterTempCelsius)
        super.addDecoder(self.waterPressureKpa)
        super.addDecoder(self.fuelPressureKpa)
        super.addDecoder(self.fuelCapacity)
        super.addDecoder(self.brake)
        super.addDecoder(self.throttle)
        super.addDecoder(self.clutch)
        super.addDecoder(self.fuelLevel)
        super.addDecoder(self.speed)
        super.addDecoder(self.rpm)
        super.addDecoder(self.maxRpm)
        super.addDecoder(self.steering)
        super.addDecoder(self.gear)
        super.addDecoder(self.numGears)
        super.addDecoder(self.increment)
        super.addDecoder(self.boostAmount)
        super.addDecoder(self.crashState)
        super.addDecoder(self.odometerKM)
        for orientation in self.orientations {
            super.addDecoder(orientation)
        }
        for localVelocity in self.localVelocities {
            super.addDecoder(localVelocity)
        }
        for worldVelocity in self.worldVelocities {
            super.addDecoder(worldVelocity)
        }
        for angularVelocity in self.angularVelocities {
            super.addDecoder(angularVelocity)
        }
        for localAcceleration in self.localAccelerations {
            super.addDecoder(localAcceleration)
        }
        for worldAcceleration in self.worldAccelerations {
            super.addDecoder(worldAcceleration)
        }
        for extentsCentre in self.extentsCentres {
            super.addDecoder(extentsCentre)
        }
        for tyreFlag in self.tyreFlags {
            super.addDecoder(tyreFlag)
        }
        for terrain in self.terrains {
            super.addDecoder(terrain)
        }
        for tyreY in self.tyreYs {
            super.addDecoder(tyreY)
        }
        for tyreRPS in self.tyreRPSs {
            super.addDecoder(tyreRPS)
        }
        for tyreTemp in self.tyreTemps {
            super.addDecoder(tyreTemp)
        }
        for tyreHeightAboveGround in self.tyreHeightsAboveGround {
            super.addDecoder(tyreHeightAboveGround)
        }
        for tyreWear in self.tyreWears {
            super.addDecoder(tyreWear)
        }
        for brakeDamage in self.brakeDamages {
            super.addDecoder(brakeDamage)
        }
        for suspensionDamage in self.suspensionDamages {
            super.addDecoder(suspensionDamage)
        }
        for brakeTempCelsius in self.brakeTempsCelsius {
            super.addDecoder(brakeTempCelsius)
        }
        for tyreTreadTemp in self.tyreTreadTemps {
            super.addDecoder(tyreTreadTemp)
        }
        for tyreLayerTemp in self.tyreLayerTemps {
            super.addDecoder(tyreLayerTemp)
        }
        for tyreCarcassTemp in self.tyreCarcassTemps {
            super.addDecoder(tyreCarcassTemp)
        }
        for tyreRimTemp in self.tyreRimTemps {
            super.addDecoder(tyreRimTemp)
        }
        for tyreInternalAirTemp in self.tyreInternalAirTemps {
            super.addDecoder(tyreInternalAirTemp)
        }
        for tyreTempLeft in self.tyreTempsLeft {
            super.addDecoder(tyreTempLeft)
        }
        for tyreTempCentre in self.tyreTempsCentre {
            super.addDecoder(tyreTempCentre)
        }
        for tyreTempRight in self.tyreTempsRight {
            super.addDecoder(tyreTempRight)
        }
        for wheelLocalPositionY in self.wheelLocalPositionsY {
            super.addDecoder(wheelLocalPositionY)
        }
        for rideHeight in self.rideHeights {
            super.addDecoder(rideHeight)
        }
        for suspensionTravel in self.suspensionTravels {
            super.addDecoder(suspensionTravel)
        }
        for suspensionVelocity in self.suspensionVelocities {
            super.addDecoder(suspensionVelocity)
        }
        for suspensionRideHeight in self.suspensionRideHeights {
            super.addDecoder(suspensionRideHeight)
        }
        for airPressure in self.airPressures {
            super.addDecoder(airPressure)
        }
        super.addDecoder(self.engineSpeed)
        super.addDecoder(self.engineTorque)
        for wing in self.wings {
            super.addDecoder(wing)
        }
        super.addDecoder(self.handBrake)
        super.addDecoder(self.aeroDamage)
        super.addDecoder(self.engineDamage)
        super.addDecoder(self.joyPad0)
        super.addDecoder(self.dPad)
        for tyreCompound in self.tyreCompounds {
            super.addDecoder(tyreCompound)
        }
        super.addDecoder(self.turboBoostPressure)
        for fullPosition in self.fullPositions {
            super.addDecoder(fullPosition)
        }
        super.addDecoder(self.brakeBias)
        super.addDecoder(self.tickCount)
    }
}

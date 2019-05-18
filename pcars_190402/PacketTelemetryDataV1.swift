//
//  PacketTelemetryDataV1.swift
//  pcars_190402
//
//  Created by Leroy on 12/5/19.
//  Copyright © 2019 RoughIdeas. All rights reserved.
//

import Foundation

///
///     Packet Telemetry Data Format 1
///
///      struct sTelemetryData
///      {
///          static const            u32 sPacketSize = 1367;
///          u16   sBuildVersionNumber;         // 0
///          u8    sPacketType;                  // 2
///
///          // Game states
///          u8    sGameSessionState;            // 3
///
///          // Participant info
///          s8    sViewedParticipantIndex;      // 4
///          s8    sNumParticipants;             // 5
///
///          // Unfiltered input
///          u8    sUnfilteredThrottle;          // 6
///          u8    sUnfilteredBrake;             // 7
///          s8    sUnfilteredSteering;          // 8
///          u8    sUnfilteredClutch;            // 9
///          u8    sRaceStateFlags;              // 10
///
///          // Event information
///          u8    sLapsInEvent;                 // 11
///
///          // Timings
///          f32   sBestLapTime;                 // 12
///          f32   sLastLapTime;                 // 16
///          f32   sCurrentTime;                 // 20
///          f32   sSplitTimeAhead;              // 24
///          f32   sSplitTimeBehind;             // 28
///          f32   sSplitTime;                   // 32
///          f32   sEventTimeRemaining;          // 36
///          f32   sPersonalFastestLapTime;      // 40
///          f32   sWorldFastestLapTime;         // 44
///          f32   sCurrentSector1Time;          // 48
///          f32   sCurrentSector2Time;          // 52
///          f32   sCurrentSector3Time;          // 56
///          f32   sFastestSector1Time;          // 60
///          f32   sFastestSector2Time;          // 64
///          f32   sFastestSector3Time;          // 68
///          f32   sPersonalFastestSector1Time;  // 72
///          f32   sPersonalFastestSector2Time;  // 76
///          f32   sPersonalFastestSector3Time;  // 80
///          f32   sWorldFastestSector1Time;     // 84
///          f32   sWorldFastestSector2Time;     // 88
///          f32   sWorldFastestSector3Time;     // 92
///
///          u16   sJoyPad;                      // 96
///
///          // Flags
///          u8    sHighestFlag;                 // 98
///
///          // Pit info
///          u8    sPitModeSchedule;             // 99
///
///          // Car state
///          s16   sOilTempCelsius;              // 100
///          u16   sOilPressureKPa;              // 102
///          s16   sWaterTempCelsius;            // 104
///          u16   sWaterPressureKpa;            // 106
///          u16   sFuelPressureKpa;             // 108
///          u8    sCarFlags;                    // 110
///          u8    sFuelCapacity;                // 111
///          u8    sBrake;                       // 112
///          u8    sThrottle;                    // 113
///          u8    sClutch;                      // 114
///          s8    sSteering;                    // 115
///          f32   sFuelLevel;                   // 116
///          f32   sSpeed;                       // 120
///          u16   sRpm;                         // 124
///          u16   sMaxRpm;                      // 126
///          u8    sGearNumGears;                // 128
///          u8    sBoostAmount;                 // 129
///          s8    sEnforcedPitStopLap;          // 130
///          u8    sCrashState;                  // 131
///
///          f32   sOdometerKM;                  // 132
///          f32   sOrientation[3];              // 136
///          f32   sLocalVelocity[3];            // 148
///          f32   sWorldVelocity[3];            // 160
///          f32   sAngularVelocity[3];          // 172
///          f32   sLocalAcceleration[3];        // 184
///          f32   sWorldAcceleration[3];        // 196
///          f32   sExtentsCentre[3];            // 208
///
///          // Wheels / Tyres
///          u8    sTyreFlags[4];                // 220
///          u8    sTerrain[4];                  // 224
///          f32   sTyreY[4];                    // 228
///          f32   sTyreRPS[4];                  // 244
///          f32   sTyreSlipSpeed[4];            // 260
///          u8    sTyreTemp[4];                 // 276
///          u8    sTyreGrip[4];                 // 280
///          f32   sTyreHeightAboveGround[4];    // 284
///          f32   sTyreLateralStiffness[4];     // 300
///          u8    sTyreWear[4];                 // 316
///          u8    sBrakeDamage[4];              // 320
///          u8    sSuspensionDamage[4];         // 324
///          s16   sBrakeTempCelsius[4];         // 328
///          u16   sTyreTreadTemp[4];            // 336
///          u16   sTyreLayerTemp[4];            // 344
///          u16   sTyreCarcassTemp[4];          // 352
///          u16   sTyreRimTemp[4];              // 360
///          u16   sTyreInternalAirTemp[4];      // 368
///          f32   sWheelLocalPositionY[4];      // 376
///          f32   sRideHeight[4];               // 392
///          f32   sSuspensionTravel[4];         // 408
///          f32   sSuspensionVelocity[4];       // 424
///          u16   sAirPressure[4];              // 440
///
///          // Extras
///          f32   sEngineSpeed;                 // 448
///          f32   sEngineTorque;                // 452
///
///          // Car damage
///          u8    sAeroDamage;                  // 456
///          u8    sEngineDamage;                // 457
///
///          // Weather
///          s8    sAmbientTemperature;          // 458
///          s8    sTrackTemperature;            // 459
///          u8    sRainDensity;                 // 460
///          s8    sWindSpeed;                   // 461
///          s8    sWindDirectionX;              // 462
///          s8    sWindDirectionY;              // 463
///
///          sParticipantInfo sParticipantInfo[56];  // 464
///          // 56*16=896
///          f32   sTrackLength;                 // 1360
///          u8    sWings[2];                    // 1364
///          u8    sDPad;                        // 1366
///          // 1368    struct is padded to
///      };
///

class PacketTelemetryDataV1  : Packet {
    
    var sessionState: Decoder
    var gameState: Decoder
    var increment: Decoder
    var viewedParticipantIndex: Decoder
    var numParticipants: Decoder
    var unfilteredThrottle: Decoder
    var unfilteredBrake: Decoder
    var unfilteredSteering: Decoder
    var unfilteredClutch: Decoder
    var raceState: Decoder
    var lapInvalidated: Decoder
    var antiLockActive: Decoder
    var boostActive: Decoder
    var lapsInEvent: Decoder
    var bestLapTime: Decoder
    var lastLapTime: Decoder
    var currentTime: Decoder
    var splitTimeAhead: Decoder
    var splitTimeBehind: Decoder
    var splitTime: Decoder
    var eventTimeRemaining: Decoder
    var personalFastestLapTime: Decoder
    var worldFastestLapTime: Decoder
    var currentSector1Time: Decoder
    var currentSector2Time: Decoder
    var currentSector3Time: Decoder
    var fastestSector1Time: Decoder
    var fastestSector2Time: Decoder
    var fastestSector3Time: Decoder
    var personalFastestSector1Time: Decoder
    var personalFastestSector2Time: Decoder
    var personalFastestSector3Time: Decoder
    var worldFastestSector1Time: Decoder
    var worldFastestSector2Time: Decoder
    var worldFastestSector3Time: Decoder
    var joyPad: Decoder
    var highestFlagColour: Decoder
    var highestFlagReason: Decoder
    var pitMode: Decoder
    var pitSchedule: Decoder
    var oilTempCelsius: Decoder
    var oilPressureKPa: Decoder
    var waterTempCelsius: Decoder
    var waterPressureKpa: Decoder
    var fuelPressureKpa: Decoder
    var carFlags: Decoder
    var fuelCapacity: Decoder
    var brake: Decoder
    var throttle: Decoder
    var clutch: Decoder
    var steering: Decoder
    var fuelLevel: Decoder
    var speed: Decoder
    var rpm: Decoder
    var maxRpm: Decoder
    var numGears: Decoder
    var gear: Decoder
    var boostAmount: Decoder
    
    ///
    /// PacketTelemetryData init
    ///
    
    override init() {
        
        self.sessionState = Decoder4MSBits()
        self.gameState = Decoder4LSBits()
        self.increment = DecoderIncrement(amount: 1)
        self.viewedParticipantIndex = Decoder8()
        self.numParticipants = Decoder8()
        self.unfilteredThrottle = Decoder8()
        self.unfilteredBrake = Decoder8()
        self.unfilteredSteering = Decoder8()
        self.unfilteredClutch = Decoder8()
        self.raceState = Decoder3LSBits()
        self.lapInvalidated = Decoder4thBit()
        self.antiLockActive = Decoder5thBit()
        self.boostActive = Decoder6thBit()
        self.lapsInEvent = Decoder8()
        self.bestLapTime = Decoder32()
        self.lastLapTime = Decoder32()
        self.currentTime = Decoder32()
        self.splitTimeAhead = Decoder32()
        self.splitTimeBehind = Decoder32()
        self.splitTime = Decoder32()
        self.eventTimeRemaining = Decoder32()
        self.personalFastestLapTime = Decoder32()
        self.worldFastestLapTime = Decoder32()
        self.currentSector1Time = Decoder32()
        self.currentSector2Time = Decoder32()
        self.currentSector3Time = Decoder32()
        self.fastestSector1Time = Decoder32()
        self.fastestSector2Time = Decoder32()
        self.fastestSector3Time = Decoder32()
        self.personalFastestSector1Time = Decoder32()
        self.personalFastestSector2Time = Decoder32()
        self.personalFastestSector3Time = Decoder32()
        self.worldFastestSector1Time = Decoder32()
        self.worldFastestSector2Time = Decoder32()
        self.worldFastestSector3Time = Decoder32()
        self.joyPad = Decoder16()
        self.highestFlagColour = Decoder4LSBits()
        self.highestFlagReason = Decoder4MSBits()
        self.pitMode = Decoder4LSBits()
        self.pitSchedule = Decoder4MSBits()
        self.oilTempCelsius = Decoder16()
        self.oilPressureKPa = Decoder16()
        self.waterTempCelsius = Decoder16()
        self.waterPressureKpa = Decoder16()
        self.fuelPressureKpa = Decoder16()
        self.carFlags = Decoder8()
        self.fuelCapacity = Decoder8()
        self.brake = Decoder8()
        self.throttle = Decoder8()
        self.clutch = Decoder8()
        self.steering = Decoder8()
        self.fuelLevel = Decoder32()
        self.speed = Decoder32()
        self.rpm = Decoder16()
        self.maxRpm = Decoder16()
        self.numGears = Decoder4MSBits()
        self.gear = Decoder4LSBits()
        self.boostAmount = Decoder8()
        
        super.init()
        
        super.addDecoder(self.sessionState)
        super.addDecoder(self.gameState)
        super.addDecoder(self.increment)
        super.addDecoder(self.viewedParticipantIndex)
        super.addDecoder(self.numParticipants)
        super.addDecoder(self.unfilteredThrottle)
        super.addDecoder(self.unfilteredBrake)
        super.addDecoder(self.unfilteredSteering)
        super.addDecoder(self.unfilteredClutch)
        super.addDecoder(self.raceState)
        super.addDecoder(self.lapInvalidated)
        super.addDecoder(self.antiLockActive)
        super.addDecoder(self.boostActive)
        super.addDecoder(self.increment)
        super.addDecoder(self.lapsInEvent)
        super.addDecoder(self.bestLapTime)
        super.addDecoder(self.lastLapTime)
        super.addDecoder(self.currentTime)
        super.addDecoder(self.splitTimeAhead)
        super.addDecoder(self.splitTimeBehind)
        super.addDecoder(self.splitTime)
        super.addDecoder(self.eventTimeRemaining)
        super.addDecoder(self.personalFastestLapTime)
        super.addDecoder(self.worldFastestLapTime)
        super.addDecoder(self.currentSector1Time)
        super.addDecoder(self.currentSector2Time)
        super.addDecoder(self.currentSector3Time)
        super.addDecoder(self.fastestSector1Time)
        super.addDecoder(self.fastestSector2Time)
        super.addDecoder(self.fastestSector3Time)
        super.addDecoder(self.personalFastestSector1Time)
        super.addDecoder(self.personalFastestSector2Time)
        super.addDecoder(self.personalFastestSector3Time)
        super.addDecoder(self.worldFastestSector1Time)
        super.addDecoder(self.worldFastestSector2Time)
        super.addDecoder(self.worldFastestSector3Time)
        super.addDecoder(self.joyPad)
        super.addDecoder(self.highestFlagColour)
        super.addDecoder(self.highestFlagReason)
        super.addDecoder(self.increment)
        super.addDecoder(self.pitMode)
        super.addDecoder(self.pitSchedule)
        super.addDecoder(self.increment)
        super.addDecoder(self.oilTempCelsius)
        super.addDecoder(self.oilPressureKPa)
        super.addDecoder(self.waterTempCelsius)
        super.addDecoder(self.waterPressureKpa)
        super.addDecoder(self.fuelPressureKpa)
        super.addDecoder(self.carFlags)
        super.addDecoder(self.fuelCapacity)
        super.addDecoder(self.brake)
        super.addDecoder(self.throttle)
        super.addDecoder(self.clutch)
        super.addDecoder(self.steering)
        super.addDecoder(self.fuelLevel)
        super.addDecoder(self.speed)
        super.addDecoder(self.rpm)
        super.addDecoder(self.maxRpm)
        super.addDecoder(self.numGears)
        super.addDecoder(self.gear)
        super.addDecoder(self.increment)
        super.addDecoder(self.boostAmount)
    }

}

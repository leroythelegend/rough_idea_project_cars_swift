//
//  Telemetry.swift
//  pcars_190402
//
//  Created by Leroy on 3/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Telemetry protocol
///

protocol Telemetry {
    
    ///
    /// read
    ///
    /// - parameters:
    ///   - completion: escapes PCar Version 2 Packets
    ///
    
    func read(completion: @escaping ((_ packets: Packets) -> Void))
}

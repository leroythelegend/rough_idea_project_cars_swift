//
//  DecoderIncrement.swift
//  pcars_190402
//
//  Created by Leroy on 7/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// Decoder Increment
///

class DecoderIncrement : Decoder {
    
    private var amount : Int
    
    ///
    /// DecoderIncrement
    ///
    /// - parameters:
    ///   - amount: Increment data by amount
    ///
    
    init(amount: Int) {
        self.amount = amount
    }

    ///
    /// Decode Increment by amount
    ///
    /// - parameters:
    ///   - data: data to be incremented
    /// - throws: Out of range
    ///

    override func decode(data: inout Data) throws {
        guard data.count >= self.amount else {
            throw PCarsUDPError.outOfRange
        }
        guard data.count > self.amount else {
            return
        }
        data = data.advanced(by: self.amount)
    }
}

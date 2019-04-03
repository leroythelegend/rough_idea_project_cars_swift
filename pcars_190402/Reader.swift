//
//  Reader.swift
//  pcars_190402
//
//  Created by Leigh McLean on 2/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import Foundation

protocol Reader {
    func read(amount : Int) throws -> (Data)
}

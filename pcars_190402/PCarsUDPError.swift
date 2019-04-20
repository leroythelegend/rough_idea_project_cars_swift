//
//  PCarsUDPError.swift
//  pcars_190402
//
//  Created by Leroy on 18/4/19.
//  Copyright © 2019 Leroy. All rights reserved.
//

import Foundation

///
/// UDP Reader Errors
///

enum PCarsUDPError : Error {
    case getAddrInfo(error: Int32)
    case socket(error: Int32)
    case bind(error: Int32)
    case read(error: Int)
    case outOfRange
    case unknown
}

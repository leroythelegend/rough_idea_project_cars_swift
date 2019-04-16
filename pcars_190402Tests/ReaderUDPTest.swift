//
//  ReaderUDPTest.swift
//  pcars_190402Tests
//
//  Created by Leigh McLean on 3/4/19.
//  Copyright © 2019 Leigh McLean. All rights reserved.
//

import XCTest

class ReaderUDPTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        do {
        
            let reader : ReaderUDP = try ReaderUDP(port : "5606")
            var i = 100
            while i != 0 {
                i -= 1
                let _ : Data = reader.read(amount : 4096)
            }
        }
        catch {
            XCTAssert(false)
            return
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

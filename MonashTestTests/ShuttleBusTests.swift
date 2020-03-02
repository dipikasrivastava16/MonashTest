//
//  ShuttleBusTests.swift
//  MonashTestTests
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import XCTest
@testable import MonashTest
class ShuttleBusTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShuttleBusTimeDuration() {
        var bus = ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: Date(timeIntervalSinceNow: 50))
        XCTAssertEqual(bus.dueIn, "< 1 min")
        
        bus = ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: Date(timeIntervalSinceNow: 600))
        XCTAssertEqual(bus.dueIn, "10 mins")
        
        bus = ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: Date(timeIntervalSinceNow: 603))
        XCTAssertEqual(bus.dueIn, "10 mins")
        
        bus = ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: Date(timeIntervalSinceNow: 653))
        XCTAssertEqual(bus.dueIn, "11 mins")
    }

}

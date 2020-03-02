//
//  DateTests.swift
//  MonashTestTests
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import XCTest
@testable import MonashTest
class DateTests: XCTestCase {

    private func createDateFromString(string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: string)
    }
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDayOfTheWeel() {
        var sampleDate = createDateFromString(string: "2020/03/01 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Sunday")
        
        sampleDate = createDateFromString(string: "2020/03/02 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Monday")
        
        sampleDate = createDateFromString(string: "2020/03/03 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Tuesday")
        
        sampleDate = createDateFromString(string: "2020/03/04 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Wednesday")
        
        sampleDate = createDateFromString(string: "2020/03/05 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Thursday")
        
        sampleDate = createDateFromString(string: "2020/02/29 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Saturday")
        
        sampleDate = createDateFromString(string: "2020/02/28 22:31")
        XCTAssertEqual(sampleDate?.dayofTheWeek, "Friday")
    }
    
    func testWeekInSemester() {
        var sampleDate = createDateFromString(string: "2020/03/01 22:31")
        var weekNumber = Date().weekInSemester(starting: sampleDate!)
        XCTAssertEqual(weekNumber,1)
        
        sampleDate = createDateFromString(string: "2020/01/12 22:31")
        weekNumber = Date().weekInSemester(starting: sampleDate!)
        XCTAssertEqual(weekNumber,8)
    }
    
    func testDateString() {
        var sampleDate = createDateFromString(string: "2020/03/01 22:31")
        XCTAssertEqual(sampleDate!.dateString,"01/03")
        
        sampleDate = createDateFromString(string: "2020/01/12 22:31")
        XCTAssertEqual(sampleDate!.dateString,"12/01")
    }
    
    func testTimeString() {
        var sampleDate = createDateFromString(string: "2020/03/01 22:31")
        XCTAssertEqual(sampleDate!.timeString,"22:31 PM")
        
        sampleDate = createDateFromString(string: "2020/01/12 02:31")
        XCTAssertEqual(sampleDate!.timeString,"02:31 AM")
    }

}

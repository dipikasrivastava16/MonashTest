//
//  DshboardViewModelTests.swift
//  MonashTestTests
//
//  Created by Deepika Srivastava on 2/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import XCTest
@testable import MonashTest
class DshboardViewModelTests: XCTestCase {
    
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

    func testLectureFetch() {
        let model = DashboardViewModel()
        model.lectureData = [Lecture(lectureName: "FIT1075 Tutorial 11", lectureBy: "Jarrod Knibbe", lectureAddress: "S3, 13 College Walk, Clayton", lectureStartTime: createDateFromString(string: "2020/03/01 17:00")!, lectureEndTime: createDateFromString(string: "2020/03/01 18:00")!),
        Lecture(lectureName: "FIT1078 Laboratory 08", lectureBy: "Akshay Sapra", lectureAddress: "144, 14 College Walk, Clayton", lectureStartTime: createDateFromString(string: "2020/03/02 15:30")!, lectureEndTime: createDateFromString(string: "22020/03/02 16:30")!),
        Lecture(lectureName: "test Lecture", lectureBy: "Deepika Srivastava", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: createDateFromString(string: "2020/03/02 10:00")!, lectureEndTime: createDateFromString(string: "2020/03/02 11:00")!),
        Lecture(lectureName: "Test Lecture1", lectureBy: "John Doe", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: createDateFromString(string: "2020/03/03 15:00")!, lectureEndTime: createDateFromString(string: "2020/03/03 16:00")!)]
        
        var data = model.getNextlectures(number: 2, onDate: createDateFromString(string: "2020/03/02 22:30")!)
        XCTAssertEqual(data.count, 0)
        
        data = model.getNextlectures(number: 2, onDate: createDateFromString(string: "2020/03/02 08:30")!)
        XCTAssertEqual(data.count, 2)
        XCTAssertEqual(data[0].lectureName, "test Lecture")
        XCTAssertEqual(data[1].lectureName, "FIT1078 Laboratory 08")
        
        data = model.getNextlectures(number: 3, onDate: createDateFromString(string: "2020/03/02 08:30")!)
        XCTAssertEqual(data.count, 2)
    }
    
    
    func testShuttleBusFetch() {
        let model = DashboardViewModel()
        model.shuttleBus = [ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: createDateFromString(string: "2020/03/01 17:00")!),
                            ShuttleBus(start: "Clayton", destination: "Peninsula", startTime: createDateFromString(string: "2020/03/02 14:00")!),
                            ShuttleBus(start: "Clayton", destination: "Peninsula1", startTime: createDateFromString(string: "2020/03/02 10:00")!),
                            ShuttleBus(start: "Clayton", destination: "Peninsula2", startTime: createDateFromString(string: "2020/03/03 10:00")!)]
        
        var data = model.getNextShuttleBuses(number: 2, onDate: createDateFromString(string: "2020/03/02 22:30")!)
        XCTAssertEqual(data.count, 0)
        
        data = model.getNextShuttleBuses(number: 2, onDate: createDateFromString(string: "2020/03/02 08:30")!)
        XCTAssertEqual(data.count, 2)
        XCTAssertEqual(data[0].destination, "Peninsula1")
        XCTAssertEqual(data[1].destination, "Peninsula")
        
        data = model.getNextShuttleBuses(number: 3, onDate: createDateFromString(string: "2020/03/02 08:30")!)
        XCTAssertEqual(data.count, 2)
    }

}

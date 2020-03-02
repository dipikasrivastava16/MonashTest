//
//  DashboardViewModel.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation

/// Model class to the ViewController
class DashboardViewModel {
    var student: Student
    var lectureData: [Lecture]
    var carpark: [CarPark]
    var shuttleBus: [ShuttleBus]
    
    /// Just initializes mock data
    init() {
        student = Student(name: "Kelly", semesterStartDate: Date.init(timeIntervalSinceNow: -86400*60))
        lectureData = [Lecture(lectureName: "FIT1031 Lecture 01", lectureBy: "Arun Kongaurthu", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: 2400), lectureEndTime: Date(timeIntervalSinceNow: 2400+3600)),
                       Lecture(lectureName: "FIT1075 Tutorial 11", lectureBy: "Jarrod Knibbe", lectureAddress: "S3, 13 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: 60*60*2), lectureEndTime: Date(timeIntervalSinceNow: 60*60*2+1800)),
                       Lecture(lectureName: "FIT1078 Laboratory 08", lectureBy: "Akshay Sapra", lectureAddress: "144, 14 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: 60*60*3), lectureEndTime: Date(timeIntervalSinceNow: 60*60*3+3600)),
                       Lecture(lectureName: "test Lecture", lectureBy: "Deepika Srivastava", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: -60*60*5), lectureEndTime: Date(timeIntervalSinceNow: -60*60*5+3600)),
                       Lecture(lectureName: "Test Lecture1", lectureBy: "John Doe", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: 60*60*4), lectureEndTime: Date(timeIntervalSinceNow: 60*60*4+3600)),
                       Lecture(lectureName: "Test Lecture2", lectureBy: "Phillip Doe", lectureAddress: "S4, 13 College Walk, Clayton", lectureStartTime: Date(timeIntervalSinceNow: 60*60*5), lectureEndTime: Date(timeIntervalSinceNow: 60*60*5+3600))]
        carpark = [CarPark(name: "Clayton Live Feed", number: 645),
        CarPark(name: "Clayton Live Feed1", number: 600),
        CarPark(name: "Clayton Live Feed2", number: 700)]
        shuttleBus = [ShuttleBus(start: "Clayton", destination: "Caulfield", startTime: Date(timeIntervalSinceNow: 50)),
                      ShuttleBus(start: "Clayton", destination: "Peninsula", startTime: Date(timeIntervalSinceNow: 1000)),
                      ShuttleBus(start: "Clayton", destination: "Peninsula1", startTime: Date(timeIntervalSinceNow: 2000)),
                      ShuttleBus(start: "Clayton", destination: "Peninsula2", startTime: Date(timeIntervalSinceNow: 3000)),
                      ShuttleBus(start: "Clayton", destination: "Peninsula3", startTime: Date(timeIntervalSinceNow: 4000)),
                      ShuttleBus(start: "Clayton", destination: "Peninsula4", startTime: Date(timeIntervalSinceNow: 5000)),
                      ShuttleBus(start: "Clayton", destination: "City", startTime: Date(timeIntervalSinceNow: -120))]
    }
    
    
    /// Filters next  'number' of lectures on a given date.
    /// - Parameters:
    ///   - number: number of lecture
    ///   - onDate: date on which lectures have to be extracted
    func getNextlectures(number: Int, onDate: Date = Date()) -> [Lecture] {
        var lectureCount = number
        // The below condition is only due to mockdata
        if number > 5 {
            print("The maximum number for lecture supported is 5 with current mock data")
            lectureCount = 5
        }
        let currentDate = onDate
        let earlyMorning = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: currentDate)!
        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: earlyMorning)!
        let range = currentDate...nextDay
        let data = lectureData
            .filter { $0.lectureStartTime > currentDate && range.contains($0.lectureStartTime) }
            .sorted { $0.lectureStartTime.compare($1.lectureStartTime) == .orderedAscending}
        if data.count < lectureCount {
            lectureCount = data.count
        }
        return Array(data[0..<lectureCount])
    }
    
    
    /// Filters next  'number' of shuttle buses on the given date.
    /// - Parameters:
    ///   - number: number of buses
    ///   - onDate: date on which buses needs to be listed
    func getNextShuttleBuses(number: Int, onDate: Date = Date()) -> [ShuttleBus] {
        var count = number
        // The below condition is only due to mockdata
        if number > 5 {
            print("The maximum number for shuttle buses supported is 5 with current mock data")
            count = 5
        }
        let currentDate = onDate
        let earlyMorning = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: currentDate)!
        let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: earlyMorning)!
        let range = currentDate...nextDay
        let data = shuttleBus
            .filter { $0.startTime > currentDate && range.contains($0.startTime) }
            .sorted { $0.startTime.compare($1.startTime) == .orderedAscending}
        if data.count < count {
            count = data.count
        }
        return Array(data[0..<count])
    }
    
    /// Get next 'number' of line Feed
    /// - Parameter number: number of feeds
    func getNextLiveFeed(number: Int) -> [CarPark] {
        var count = number
        if number > 3 {
            print("The maximum number for shuttle buses supported is 5 with current mock data")
            count = 3
        }
        return Array(carpark[0..<count])
    }
    
}

//
//  NSDate+Utilities.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation

extension Date {
    
    /// Returns the string value of the day of the week
    var dayofTheWeek: String {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        let weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        return weekdays[weekDay-1]
    }
    
    /// Returns the week number from a  date. 1st week is considered Week 1 not week 0
    /// - Parameter starting: Starting date
    func weekInSemester(starting: Date) -> Int {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekforTodaysDate = myCalendar.component(.weekOfYear, from: self)
        let weekforSemStartDate = myCalendar.component(.weekOfYear, from: starting)
        return weekforTodaysDate - weekforSemStartDate + 1
    }
    
    /// Returns date in dd/MM format like 12/03 which is 12th March
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: self)
    }
    
    /// Start time in HH:mm a format e.g 08:00 AM
    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: self)
    }
}

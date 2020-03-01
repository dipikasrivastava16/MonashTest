//
//  NSDate+Utilities.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation

extension Date {
    var dayofTheWeek: String {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        let weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
        return weekdays[weekDay]
    }
    
    func weekInSemester(starting: Date) -> Int {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekforTodaysDate = myCalendar.component(.weekOfYear, from: self)
        let weekforSemStartDate = myCalendar.component(.weekOfYear, from: starting)
        return weekforTodaysDate - weekforSemStartDate
    }
    
    var todayDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: self)
    }
}

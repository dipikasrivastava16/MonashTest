//
//  Lecture.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation

struct Lecture {
    var lectureName: String
    var lectureBy: String
    var lectureAddress: String
    var lectureStartTime: Date
    var lectureEndTime: Date                   
}
extension Lecture {
    var startTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: lectureStartTime)
    }
    var endTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: lectureEndTime)
    }
}

//
//  ShuttleBus.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation
struct ShuttleBus {
    var start: String
    var destination: String
    var startTime: Date
}

extension ShuttleBus {
    var dueIn: String {
        let difference = abs(Date().timeIntervalSince(startTime)/60)
        if difference < 1 {
            return "< 1 min"
        } else {
            return "\(Int(difference)) min"
        }
    }
}

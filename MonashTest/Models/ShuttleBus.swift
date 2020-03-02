//
//  ShuttleBus.swift
//  MonashTest
//
//  Created by Deepika Srivastava on 1/3/20.
//  Copyright © 2020 Deepika Srivastava. All rights reserved.
//

import Foundation

/// Model Representing Inter campus Shuttle Bus
struct ShuttleBus {
    
    /// Start location of the bus
    var start: String
    
    /// End location of the bus
    var destination: String
    
    /// Start time of the bus
    var startTime: Date
}

extension ShuttleBus {
    
    /// String representation of the time remaining  in minutes for the bus to start
    var dueIn: String {
        let difference = abs(Date().timeIntervalSince(startTime)/60)
        if difference < 1 {
            return "< 1 min"
        } else {
            return "\(Int(difference)) min"
        }
    }
}

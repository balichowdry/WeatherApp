//
//  SavedData.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import Foundation

struct SavedData: Codable {
    let time: Date
    let temperatureHigh: Double
    let temperatureLow: Double
    let icon: String
    let humidity: Double
}

extension SavedData: Equatable {
    static func ==(lhs: SavedData, rhs: SavedData) -> Bool {
        return lhs.time == rhs.time &&
            lhs.temperatureHigh == rhs.temperatureHigh &&
            lhs.temperatureLow == rhs.temperatureLow &&
            lhs.icon == rhs.icon &&
            lhs.humidity == rhs.humidity
    }
}

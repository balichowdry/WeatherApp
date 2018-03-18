//
//  WeatherDayViewModel.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.


import RealmSwift
import UIKit

struct WeatherDayViewModel {
    let weatherDay: SavedData
    
    init(_ weatherDay: SavedData) {
        self.weatherDay = weatherDay
    }
    
    private var dateFormatter = DateFormatter()
    
    var week: String {
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: weatherDay.time)
    }
    
    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        
        return dateFormatter.string(from: weatherDay.time)
    }
    
    var temperature: String {
        let min = format(temperature: weatherDay.temperatureLow)
        let max = format(temperature: weatherDay.temperatureHigh)
        
        return "\(min) ~ \(max)"
    }
    
    var humidity: String {
        return String(format: "%.0f %%", weatherDay.humidity)
    }
    
    /// - Parameter temperature: temperature
    /// - Returns: temperature string
    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureMode() {
        case .celsius:
            return String(format: "%.1f ℃", temperature.toCelcius())
        case .fahrenheit:
            return String(format: "%.1f ℉", temperature)
        }
    }
    
    
}

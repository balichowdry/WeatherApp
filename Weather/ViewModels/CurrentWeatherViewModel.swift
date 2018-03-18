//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit

struct CurrentWeatherViewModel {
    var isLocationReady = false
    var isWeatherReady = false
    
    var isUpdateReady: Bool {
        return isLocationReady && isWeatherReady
    }
    
    var location: Location! {
        didSet {
            if location != nil {
                isLocationReady = true
            }
            else {
                isLocationReady = false
            }
        }
    }
    
    var weather: Main! {
        didSet {
            if weather != nil {
                isWeatherReady = true
            }
            else {
                isWeatherReady = false
            }
        }
    }
    
    var city: String {
        return location.name
    }
    
    var temperature: String {
        let value = weather.temp
        //  return "\(String(describing: value))";
        switch UserDefaults.temperatureMode() {
        case .celsius:
            return String(format: "%.1f ℃", value.toCelcius())
        case .fahrenheit:
            return String(format: "%.1f ℉", value)
        }
    }
    
    var humidity: String {
        return String(format: "%.1f %%", weather.humidity * 100)
    }
    
    
    var date: String {
        let dateFormatter = DateFormatter()
        let now = Date()
        dateFormatter.dateFormat = UserDefaults.dateMode().format
        let timestamp = DateFormatter.localizedString(from: now as Date, dateStyle: .medium, timeStyle: .short)
        
        return timestamp
    }
}

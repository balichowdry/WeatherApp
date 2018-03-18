//
//  WeekWeatherViewModel.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.


import UIKit

struct SavedWeatherViewModel {
    let weatherData: [SavedData]
    
    init(_ weatherData: [SavedData]) {
        self.weatherData = weatherData
    }
    
    var numberOfSection: Int {
        return 1
    }
    
    var numberOfDays: Int {
        return weatherData.count
    }
    
    func viewModel(for index: Int) -> WeatherDayViewModel {
        return WeatherDayViewModel(weatherData[index])
    }
}


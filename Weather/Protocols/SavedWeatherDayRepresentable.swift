//
//  SavedWeatherDayRepresentable.swift
//  Weather
//
//  Created by BilalSattar on 13/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import UIKit

protocol SavedWeatherDayRepresentable {
    var week: String { get }
    var date: String { get }
    var temperature: String { get }
    var weatherIcon: UIImage? { get }
    var humidity: String { get }
}

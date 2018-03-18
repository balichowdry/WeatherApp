//
//  AppConfig.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import Foundation

struct API {
//    static let key = "appid=06db44f389d2172e9b1096cdce7b051c"
    // Hard coded Api parameter
    //To do
    static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=06db44f389d2172e9b1096cdce7b051c&lat=3.05499236261885&lon=101.687518495442")!
    static let authenticatedURL = baseURL
        //.appendingPathComponent("?\(key)")
}

//
//  Double.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import Foundation

extension Double {
    func toCelcius() -> Double {
        return (self - 32.0) / 1.8
    }
}

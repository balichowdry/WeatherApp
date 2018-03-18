//
//  Primitivies.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
extension Int {
  var cgFloatValue: Float {
    get {
      return Float(self)
    }
  }
  
  var thousand: Int {
    get {
      return self * 1000
    }
  }
  
  var million: Int {
    get {
      return self * 1000000
    }
  }
}

extension Float {
  var million: Int {
    get {
      return Int(self * 1000000.0)
    }
  }
}

extension Double {
  func roundingDown(nearest: Double) -> Double {
    let n = 1 / nearest
    let numberToRound = self * n
    return numberToRound.rounded() / n - 0.5
  }
}


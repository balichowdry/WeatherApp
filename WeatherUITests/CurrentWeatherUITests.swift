//
//  CurrentWeatherUITests.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//
//UITests
//"main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},


import XCTest

class CurrentWeatherUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app.launchArguments += ["UI-TESTING"]
        app.launchEnvironment["WeatherJSON"] = """
            {
            "main": {
                "temp": 289.5,
                "humidity": 89,
                "pressure": "1013",
                "temp_min": 287.04,
                "temp_max": "292.04"
                }
            }
        """
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationButtonExists() {
        let locationBtn = app.buttons["locationBtn"]
        
        XCTAssert(locationBtn.exists)
    }
    
    
}

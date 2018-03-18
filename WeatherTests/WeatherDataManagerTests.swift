//
//  WeatherDataManagerTests.swift
//  WeatherTests
//
//  Created by BilalSattar on 13/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import XCTest
import Realm
import RealmSwift
//"main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},

@testable import Weather

class WeatherDataManagerTests: XCTestCase {
    
    let session = MockURLSession()
    let dataTask = MockURLSessionDataTask()
    
    var manager: WeatherDataManager? = nil
    
    override func setUp() {
        super.setUp()
        
        session.sessionDataTask = dataTask
        manager = WeatherDataManager(baseURL: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139")!, urlSession: session)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWeatherDataAtStartSession() {
        manager?.weatherDataAt(latitude: 35.00, longitude: 139.0) { (_, _) in }
        
        XCTAssert(session.sessionDataTask.isResumeCalled)
    }
    
    func testWeatherDataAtGetsData() {
        let expect = expectation(description: "loading data from: \(API.authenticatedURL)")
        var data: Main? = nil
        
        WeatherDataManager.shared.weatherDataAt(latitude: 35.00, longitude: 139.0, completion: { (response, error) in
            data = response
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(data)
    }
    
    func testWeatherDataAtFailedRequest() {
        session.responseError = NSError(domain: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139", code: 100, userInfo: nil)
        
        var error: DataManagerError? = nil
        manager?.weatherDataAt(latitude: 35.00, longitude: 139.0, completion: { (_, e) in
            error = e
        })
        
        XCTAssertEqual(error, DataManagerError.failedRequest)
    }
    
    func testWeatherDataAtResponseStatusCodeNotEqualTo200() {
        session.responseHeader = HTTPURLResponse(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let data = "{}".data(using: .utf8)!
        session.responseData = data
        
        var error: DataManagerError? = nil
        manager?.weatherDataAt(latitude: 35.00, longitude: 139.0, completion: { (_, e) in
            error = e
        })
        
        XCTAssertEqual(error, DataManagerError.failedRequest)
    }
    
    func testWeatherDataAtHandleInvalidResponse() {
        session.responseHeader = HTTPURLResponse(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let data = "{".data(using: .utf8)!
        session.responseData = data
        
        var error: DataManagerError? = nil
        manager?.weatherDataAt(latitude: 35.00, longitude: 139.00, completion: { (_, e) in
            error = e
        })
        
        XCTAssertEqual(error, DataManagerError.invalidResponse)
    }
    
    func testWeatherDataAtHandlerResponseDecode() {
        session.responseHeader = HTTPURLResponse(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let data = """
         {
            "main": {
                "temp": 289.5,
                "humidity": 89,
                "pressure": "1013",
                "temp_min": 287.04,
                "temp_max": "292.04"
                }
            }
        """.data(using: .utf8)!
        session.responseData = data
        
        let decoded: Main? = nil        
        manager?.weatherDataAt(latitude: 35.00, longitude: 139.00, completion: { (d, _) in
            decoded = d
        })
        
    }
}

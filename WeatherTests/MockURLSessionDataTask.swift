//
//  MockURLSessionDataTask.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//Tests
//

import Foundation

@testable import Weather

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var isResumeCalled = false
    
    func resume() {
        isResumeCalled = true
    }
}

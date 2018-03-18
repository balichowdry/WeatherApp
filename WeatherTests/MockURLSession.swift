//
//  MockURLSession.swift
//  Weather
//
//  Created by BilalSattar on 10/03/2018.
//Tests


import Foundation

@testable import Weather

class MockURLSession: URLSessionProtocol {
    var responseData: Data?
    var responseHeader: HTTPURLResponse?
    var responseError: Error?
    
    var sessionDataTask = MockURLSessionDataTask()
    
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskHandler) -> URLSessionDataTaskProtocol {
        completionHandler(responseData, responseHeader, responseError)
        
        return sessionDataTask
    }
}

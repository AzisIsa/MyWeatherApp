//
//  MyWeatherAppThreeTests.swift
//  MyWeatherAppThreeTests
//
//  Created by Azis Isa on 5/28/19.
//  Copyright © 2019 Azis Isa. All rights reserved.
//

import XCTest
@testable import MyWeatherAppThree

class MyWeatherAppThreeTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToDarkSkyGetsHTTPStatusCode200() {
        // given
        let url =
            URL(string: "https://api.darksky.net/forecast/25636ea5d6a23fbec62ba9099a153648/42.8746,74.5698")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    func testCallToDarkSkyCompletes() {
        // given
        let url =
            URL(string: "https://api.darksky.net/forecast/25636ea5d6a23fbec62ba9099a153648/42.8746,74.5698")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    

   



}

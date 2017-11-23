//
//  ErrorTest.swift
//  SpotifyAppTests
//
//  Created by Juliana Loaiza on 11/15/17.
//  Copyright © 2017 Juliana Loaiza Labrador. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import SpotifyApp

class ErrorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_Error(){
        let ErrorJson = "{\"error\": {\"status\": 401, \"message\": \"The access token expired\"} }"
        let error = Mapper<Message>().map(JSONString: ErrorJson)
        XCTAssertEqual(error?.message, "The access token expired")
        XCTAssertEqual(error?.status, 401)
        XCTAssertNotEqual(error?.message, "Error")
        XCTAssertNotEqual(error?.status, 0)
    }
    
}


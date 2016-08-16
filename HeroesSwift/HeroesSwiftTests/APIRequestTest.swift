//
//  APIRequestTest.swift
//  HeroesSwift
//
//  Created by Vinicius A. Minozzi on 8/16/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import XCTest
@testable import HeroesSwift

class APIRequestTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAPIRequest() {
        XCTAssertEqual(APIRequest.serverAPI, "http://gateway.marvel.com:80")
        XCTAssertEqual(APIRequest.pathAPI, "/v1/public/characters/1009351/comics?")
        XCTAssertEqual(APIRequest.tsAPI, "1")
        XCTAssertEqual(APIRequest.apikey, "bb4470a46d0659a43c566ac6056ed48d")
        XCTAssertEqual(APIRequest.hashNumer, "479474cf0a28eac9998960da4d96f06b")
    }
    
}

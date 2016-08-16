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
    
    func testAPIRequest() {
        XCTAssertEqual(APIRequest.serverAPI, "http://gateway.marvel.com:80")
        XCTAssertEqual(APIRequest.pathAPI, "/v1/public/characters/1009351/comics?")
        XCTAssertEqual(APIRequest.tsAPI, "1")
        XCTAssertEqual(APIRequest.apikey, "bb4470a46d0659a43c566ac6056ed48d")
        XCTAssertEqual(APIRequest.hashNumer, "479474cf0a28eac9998960da4d96f06b")
    }
    
}

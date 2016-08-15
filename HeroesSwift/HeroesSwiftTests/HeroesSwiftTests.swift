//
//  HeroesSwiftTests.swift
//  HeroesSwiftTests
//
//  Created by Vinicius A. Minozzi on 8/15/16.
//  Copyright © 2016 Vinicius A. Minozzi. All rights reserved.
//

import XCTest
import UIKit
@testable import HeroesSwift

class HeroesSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let magazine = MagazineController()
        
        magazine.getMagazines({ (responseArray) in
            
            print(responseArray)
            
        }) { (errorString) in
            
            print(errorString)
        }
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
    
    func testResultViewModelWithMagazine() {
        
        let dictThumbnail: NSDictionary = ["path" : "pathWayTest", "extension" : "png"] // let = constante, var = variavel 
        
        let magazine = ResultModel(title: "HULK", thumbnail: dictThumbnail, pageCount: 1, issueNumber: 1, prices: ["100,00", "50,00", "70,00"], modified: "", textObjects: ["txt3", "txt2", "txt1"])
        
        let magazineViewModel = ResultViewModel(result: magazine)
        
        XCTAssertNotNil(magazineViewModel.titleText)
        XCTAssertNotNil(magazineViewModel.thumbnailDictionary)
        XCTAssertNotNil(magazineViewModel.pageCountInt)
        XCTAssertNotNil(magazineViewModel.issueNumberInt)
        XCTAssertNotNil(magazineViewModel.pricesArray)
        XCTAssertNotNil(magazineViewModel.modifiedDate)
        XCTAssertNotNil(magazineViewModel.textObjectsArray)
    }
}

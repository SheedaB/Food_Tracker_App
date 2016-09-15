//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rasheda Babatunde on 9/15/16.
//  Copyright © 2016 Rasheda Babatunde. All rights reserved.
//

import UIKit
import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
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
    
    //MARK: FoodTracker Tests
    
    //Test to confirm that the Meal initializer returns when no name or a negative rating is provided
    
    func testMealInitialization() {
        
        //Sucess case. 
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure Case.
//        let noName = Meal(name: "", photo: nil, rating: 0)
    }
}
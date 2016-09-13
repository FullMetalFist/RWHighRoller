//
//  RollTests.swift
//  High Roller
//
//  Created by Michael Vilabrera on 9/11/16.
//  Copyright © 2016 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class RollTests: XCTestCase {
  
  
  var roll: Roll!
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
      roll = Roll()
      roll.changeNumberOfDice(newDiceCount: 5)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testCreatingRollOfDice() {
    
    XCTAssertNotNil(roll)
    XCTAssertEqual(roll.dice.count, 5)
  }
  
  func testTotalForDiceBeforeRolling_ShouldBeZero() {
    
    let total = roll.totalForDice()
    XCTAssertEqual(total, 0)
  }
  
  func testTotalForDiceAfterRolling_ShouldBeBetween5And30() {
    roll.rollAll()
    let total = roll.totalForDice()
    XCTAssertGreaterThanOrEqual(total, 5)
    XCTAssertLessThanOrEqual(total, 30)
  }
}

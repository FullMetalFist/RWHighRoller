//
//  DiceTests.swift
//  High Roller
//
//  Created by Michael Vilabrera on 9/10/16.
//  Copyright © 2016 Sarah Reichelt. All rights reserved.
//

import XCTest
@testable import High_Roller

class DiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
    func testForDice() {
      let _ = Dice()
    }
  
  func testValueForNewDiceIsNil() {
    let testDie = Dice()
    
    XCTAssertNil(testDie.value, "Die value should be nil after init")
  }
  
  func testRollDie() {
    var testDie = Dice()
    testDie.rollDie()
    
    XCTAssertNotNil(testDie.value)
  }
  
  func testDiceRoll_ShouldBeFromOneToSix() {
    var testDie = Dice()
    testDie.rollDie()
    
    XCTAssertTrue(testDie.value! >= 1)
    XCTAssertTrue(testDie.value! <= 6)
    XCTAssertFalse(testDie.value == 0)
  }
  
  func testRollsAreSpreadRoughlyEvenly() {
    performMultipleRollTests()
//    var testDie = Dice()
//    var rolls: [Int: Double] = [:]
//    
//    // 1
//    let rollCounter = 600.0
//    
//    for _ in 0 ..< Int(rollCounter) {
//      testDie.rollDie()
//      guard let newRoll = testDie.value else {
//        // 2
//        XCTFail()
//        return
//      }
//      
//      // 3
//      if let existingCount = rolls[newRoll] {
//        rolls[newRoll] = existingCount + 1
//      } else {
//        rolls[newRoll] = 1
//      }
//    }
//    
//    // 4
//    XCTAssertEqual(rolls.keys.count, 6)
//    
//    // 5
//    for (key, roll) in rolls {
//      XCTAssertEqualWithAccuracy(roll, rollCounter / 6, accuracy: rollCounter / 6 * 0.3,
//                                 "Dice gace \(roll) x \(key)")
//    }
  }
  
  func testRollingTwentySidedDice() {
    var testDie = Dice()
    testDie.rollDie(numberOfSides: 20)
    
    XCTAssertNotNil(testDie.value)
    XCTAssertTrue(testDie.value! >= 1)
    XCTAssertTrue(testDie.value! <= 20)
  }
  
  func testTwentySidedRollsAreSpreadRoughlyEvenly() {
    performMultipleRollTests(numberOfSides: 20)
//    var testDie = Dice()
//    var rolls: [Int: Double] = [:]
//    let rollCounter = 2000.0
//    
//    for _ in 0 ..< Int(rollCounter) {
//      testDie.rollDie(numberOfSides: 20)
//      guard let newRoll = testDie.value else {
//        XCTFail()
//        return
//      }
//      
//      if let existingCount = rolls[newRoll] {
//        rolls[newRoll] = existingCount + 1
//      } else {
//        rolls[newRoll] = 1
//      }
//    }
//    
//    XCTAssertEqual(rolls.keys.count, 20)
//    
//    for (key, roll) in rolls {
//      XCTAssertEqualWithAccuracy(roll, rollCounter / 20, accuracy: rollCounter / 20 * 0.3, "Dice gave \(roll) x \(key)")
//    }
  }
}

extension DiceTests {
  
  fileprivate func performMultipleRollTests(numberOfSides: Int = 6, line: UInt = #line) {
    var testDie = Dice()
    var rolls: [Int: Double] = [:]
    let rollCounter = Double(numberOfSides) * 100.0
    let expectedResult = rollCounter / Double(numberOfSides)
    let allowedAccuracy = rollCounter / Double(numberOfSides) * 0.3
    
    for _ in 0 ..< Int(rollCounter) {
      testDie.rollDie(numberOfSides: numberOfSides)
      guard let newRoll = testDie.value else {
        XCTFail()
        return
      }
      
      if let existingCount = rolls[newRoll] {
        rolls[newRoll] = existingCount + 1
      } else {
        rolls[newRoll] = 1
      }
    }
    
    XCTAssertEqual(rolls.keys.count, numberOfSides, line: line)
    
    for (key, roll) in rolls {
      XCTAssertEqualWithAccuracy(roll, expectedResult, accuracy: allowedAccuracy, "Dice gave \(roll) x \(key)", line: line)
    }
  }
}

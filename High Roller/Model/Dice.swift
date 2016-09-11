//
//  Dice.swift
//  High Roller
//
//  Created by Michael Vilabrera on 9/10/16.
//  Copyright © 2016 Sarah Reichelt. All rights reserved.
//

import Foundation

struct Dice {
  
  var value: Int?
  
  mutating func rollDie(numberOfSides: Int = 6, line: UInt = #line) {
    value = Int(arc4random_uniform(UInt32(numberOfSides))) + 1
  }
}

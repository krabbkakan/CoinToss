//
//  RandomNumber.swift
//  CoinFlipSwipeView
//
//  Created by Erik Hede on 2018-02-19.
//  Copyright © 2018 Erik Hede. All rights reserved.
//
import Foundation
import UIKit

class RandomNumber {
    
    var randomNumber : Int = 0
    
    func getRandomNumBetweenZeroAndOne() -> Int {
      
        randomNumber = Int(arc4random_uniform(2))
        
        return randomNumber
    }
}

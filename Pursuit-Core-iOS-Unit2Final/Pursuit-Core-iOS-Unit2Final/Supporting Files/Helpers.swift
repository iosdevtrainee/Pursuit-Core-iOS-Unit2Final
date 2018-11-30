//
//  Helpers.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by J on 11/30/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

struct Helpers {
  
  static func crayonToRGB(crayon:Crayon, _ constant:CGFloat = 255) -> (red:CGFloat, green:CGFloat, blue:CGFloat){
    return (red:CGFloat(crayon.red) / constant,
            green:CGFloat(crayon.green) / constant,
            blue:CGFloat(crayon.blue) / constant)
  }
  static func roundNumber(number:CGFloat, decimalsPlaces:Int = 2, base:Double=10.0) -> Double{
//    round(test * 100.0) / 100.0)
    let place = decimalsPlaces
    let number = Double(number)
    let constant = pow(base,Double(place))
    return round((number * constant)) / constant
    
  }
}


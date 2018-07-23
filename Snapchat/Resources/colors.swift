//
//  colors.swift
//  PriceApp
//
//  Created by Biken Maharjan on 7/23/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit


struct Color{
    
    static func getAccentColor() -> UIColor {
        return UIColor(red: 89/255, green: 84/255, blue: 142/255, alpha: 1.0)
    }
    
    static func backgroundColor() -> UIColor {
        return UIColor(red: 243/255, green: 245/255, blue: 247/255, alpha: 1)
    }
    
    static func secondaryAccentColor() -> UIColor {
        return UIColor(red: 209/255, green: 181/255, blue: 134/255, alpha: 1)
    }
    
    static func negativeColor() -> UIColor {
        return UIColor(red: 255/255, green: 109/255, blue: 109/255, alpha: 1)
    }
    
}

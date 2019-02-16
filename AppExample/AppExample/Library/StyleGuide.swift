//
//  StyleGuide.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/16/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Fonts
extension UIFont {
    enum Raleway: String {
        case bold = "Raleway-Bold"
        case regular = "Raleway-Regular"
        case light = "Raleway-Light"
        
        
        func withSize(_ size: CGFloat) -> UIFont? {
            return UIFont(name: self.rawValue, size: size)
        }
    }
}

//MARK: - Colors
extension UIColor {
    static var aeFlatGrey: UIColor {
        return UIColor(hex: "#253536")
    }
}

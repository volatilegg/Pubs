//
//  UIColorExtensions.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import UIKit

/// https://github.com/qvik/qvik-swift-ios/blob/develop/QvikSwift/UIColorExtensions.swift
extension UIColor {
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: Double) {
        self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
    }

    convenience init(hexString: String) {
        var hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)

        if hexString.hasPrefix("#") {
            hexString = String(hexString.removeFirst())
        }

        guard hexString.count == 6 || hexString.count == 8 else {
            self.init(white: 1.0, alpha: 1.0)
            return
        }

        if hexString.count == 8 {
            hexString = "\(hexString)FF"
        }

        let scanner = Scanner(string: hexString)

        var rgbaValue: UInt32 = 0
        guard scanner.scanHexInt32(&rgbaValue) else {
            self.init(white: 1.0, alpha: 1.0)
            return
        }

        let red = (rgbaValue & 0xFF000000) >> 24
        let green = (rgbaValue & 0x00FF0000) >> 16
        let blue = (rgbaValue & 0x0000FF00) >> 8
        let alpha = rgbaValue & 0x000000FF

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
}

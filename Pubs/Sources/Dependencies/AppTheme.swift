//
//  AppTheme.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import UIKit

/*public protocol Palette {
    var background: UIColor { get }
    var text: UIColor { get }
    var mainHighLight: UIColor { get }
    var secondaryHighLight: UIColor { get }
}

public struct DarkTheme: Palette {

    public var background: UIColor {
        return UIColor(hexString: "1A1C2D")
    }

    public var text: UIColor {
        return UIColor.white
    }

    public var mainHighLight: UIColor {
        return UIColor(hexString: "9DCBFF")
    }

    public var secondaryHighLight: UIColor {
        return UIColor(hexString: "00CFF8")
    }

}

public struct LightTheme: Palette {

    public var background: UIColor

    public var text: UIColor

    public var mainHighLight: UIColor

    public var secondaryHighLight: UIColor

}

struct AppTheme {
    static let colorTheme: Palette = DarkTheme()
}
*/

protocol Theme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var secondaryTextColor: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = UIColor.white
    let textColor = UIColor.black
    let secondaryTextColor = UIColor.blue
}

struct DarkTheme: Theme {
    let backgroundColor = UIColor.black
    let textColor = UIColor.white
    let secondaryTextColor = UIColor.gray
}

enum ThemeType: ThemeProvider {
    case light, dark
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

let themeService = ThemeType.service(initial: .light)

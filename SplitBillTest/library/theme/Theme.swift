//
//  Theme.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit


enum Theme:Int {
    case defaultTheme
    
    static func curr() -> Theme {
        if let storedTheme = AppSettings.getThemeSelected() {
            return Theme(rawValue: storedTheme)!
        } else {
            return .defaultTheme
        }
    }
    
    var primaryColor:UIColor {
        switch self {
        case .defaultTheme:
            return UIColor.init(hexString: "#FE4F20");
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .defaultTheme:
            return UIColor.init(hexString: "#ffffff");
        }
    }
    
    var titleTextColor: UIColor {
        switch self {
        case .defaultTheme:
            return UIColor.init(hexString: "#232323");
        }
    }
    var subtitleTextColor: UIColor {
        switch self {
        case .defaultTheme:
            return UIColor.init(hexString: "#000000").withAlphaComponent(0.5);
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .defaultTheme:
            return UIColor.init(hexString: "#FE4F20");
        }
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .defaultTheme:
            return .default
        }
    }
}




//
//  ThemeManager.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class ThemeManager {
    
    static func currTheme() -> Theme {
        return Theme.curr();
    }
    
    static func applyTheme(theme: Theme) {
        // First persist the selected theme using NSUserDefaults.
        AppSettings.setThemeSelected(selectedTheme: theme.rawValue);
        UserDefaults.standard.synchronize()
        
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.primaryColor
        
        UINavigationBar.appearance().barStyle = theme.barStyle
    }
}




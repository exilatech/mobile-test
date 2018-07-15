//
//  AppSettings.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class AppSettings :NSObject{

      static private let prefs:UserDefaults = UserDefaults.standard
    
    static func setThemeSelected(selectedTheme:Int) {
        self.prefs.set(selectedTheme , forKey: "ThemeSelected")
    }
    
    static func getThemeSelected()->Int? {
        return (self.prefs.value(forKey: "ThemeSelected") as AnyObject).integerValue;
    }
}

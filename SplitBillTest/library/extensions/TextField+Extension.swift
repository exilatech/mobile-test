//
//  TextField+Extension.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

extension UITextField {
    
    
    /// Show PickerView and load the provided data
    ///
    /// - Parameters:
    ///   - data: data to be laoded in the pickerView
    ///   - updateStatus: Either textField should update automatically according the selection in pickerView?
    func loadDropdownData(data: [String],autoUpdateTextField updateStatus:Bool = true) {
        self.inputView = PickerView(pickerData: data, dropdownField: (updateStatus) ? self: nil)
    }
    
    
    /// Show PickerView and load the provided data
    ///
    /// - Parameters:
    ///   - data: data to be laoded in the pickerView
    ///   - updateStatus: Either textField should update automatically according the selection in pickerView?
    ///   - selectionHandler: callback for selection events
    func loadDropdownData(data: [String], onSelect selectionHandler : @escaping (_ selectedText: String) -> Void ,autoUpdateTextField updateStatus:Bool = true) {
        self.inputView = PickerView(pickerData: data, dropdownField: (updateStatus) ? self: nil, onSelect: selectionHandler)
        
    }
}

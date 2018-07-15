//
//  PickerView.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit
import Foundation

class PickerView : UIPickerView {
    
    /// Data to be shown in the pickerView
    var pickerData : [String]!
    
    
    /// TextField corresponding to the pickerview.
    var pickerTextField : UITextField?
    
    
    /// Callback for text selection event
    var selectionHandler : ((_ selectedText: String) -> Void)?
    
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - pickerData: Data to be shown in the pickerView
    ///   - dropdownField: TextField corresponding to the pickerView
    init(pickerData: [String], dropdownField: UITextField?) {
        super.init(frame: .zero)
        
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        
        self.delegate = self
        self.dataSource = self
    }
    
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - pickerData: Data to be shown in the pickerView
    ///   - dropdownField: TextField corresponding to the pickerView
    ///   - selectionHandler: Callback for text selection event
    convenience init(pickerData: [String], dropdownField: UITextField?, onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        self.init(pickerData: pickerData, dropdownField: dropdownField)
        self.selectionHandler = selectionHandler
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}

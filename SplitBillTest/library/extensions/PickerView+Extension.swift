//
//  PickerView+Extension.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

extension PickerView:  UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    
    //------------------UIPickerView Delegate and DataSource functions-------------------------//
    
    // Sets the number of rows in the picker view
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerTextField?.text = pickerData[row]
        self.selectionHandler?(pickerData[row])
    }
}

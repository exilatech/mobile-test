//
//  TotalAmountViewModel.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class TotalAmountViewModel {
    
    /// Total amount of bill to split
    var totalAmount: Double = 0 {
        didSet {
        }
    }
    
    /// Text message for alert
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    
    /// Called when alertMessage is updated. It aks the corresponding controller to show an alert.
    var showAlertClosure: (()->())?
    
    init() {}
    
    
    /// Updates the value of totalAmount. In case of empty value, it sets 0 for totalAmount.
    ///
    /// - Parameter value: text from input field for amount
    func updateTotalAmount(value:String?){
        if let value = value, let amount = Double(value) {
            totalAmount = amount;
        }else{
            totalAmount = 0;
        }
    }
    
}

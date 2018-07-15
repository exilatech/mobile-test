//
//  detailViewModel.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    
    var totalAmount: Double = 0 {
        didSet {
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    var numberOfPeople: Int = 1{
        didSet {
            self.updateAmountPerHead()
        }
    }
    
    var tipPercentage: Double  = 0 {
        didSet {
            if oldValue != tipPercentage {
                self.updateAmountPerHead()
            }
        }
    }
    
    var amountPerHead: Double = 0 {
        didSet {
            self.setAmountPerHead?(amountPerHead);
        }
    }
    
    var showAlertClosure: (()->())?
    var setAmountPerHead: ((_ amount:Double)->())?
    var tipPercentUpdated: ((_ amount:Double,_ isSourceSlider:Bool)->())?
    
    
    init() {
    }
    
    func updateAmountPerHead(){
        let amount = totalAmount;
        let tipAmount = amount * ( tipPercentage / 100.0);
        amountPerHead = (tipAmount + amount) / Double(numberOfPeople);
    }
    
    func updateTipPercentage(value:String?,isSourceSlider:Bool){
        let oldValue = tipPercentage;
        if let value = value, let amount = Double(value) {
            if amount > 100 {
                alertMessage = "Tip percentage can't be more than 100";
                return;
            }
            tipPercentage = amount;
        }else{
            tipPercentage = 0;
        }
        
        if oldValue != tipPercentage {
            self.tipPercentUpdated?(tipPercentage,isSourceSlider);
        }
    }
}

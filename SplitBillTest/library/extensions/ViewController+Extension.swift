//
//  ViewController+Extension.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    /// Show Alert dialog
    ///
    /// - Parameters:
    ///   - title: Title for alert dialog
    ///   - message: message to be shown
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    /// Add tap gesture which will end editting on viewController when tapping on the given view.
    ///
    /// - Parameter view: View to add tapp gesture
    func addEndEdittingOnTap(view:UIView){
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(endEdditingTapHandler(gesture:)))
        view.isUserInteractionEnabled = true;
        view.addGestureRecognizer(tapGesture);
       
    }
    
    @objc func endEdditingTapHandler(gesture:UIGestureRecognizer){
        self.view.endEditing(true);
    }
}

//
//  DetailViewController.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var noOfPeopleTf: UITextField!
    @IBOutlet weak var tipPercentageTf: UITextField!
    @IBOutlet weak var amountPerHeadLbl: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    var totalAmount = 0.0;
    
    lazy var viewModel: DetailViewModel = {
        return DetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initV();
        initVM()
    }
    
    /// Initialize views
    func initV() {
        
        //set TotalAmount label
        self.totalAmountLbl.text = totalAmount.formateTo(2);
        
        //set initial no. of people to 1.
        noOfPeopleTf.text = "1";
        
        //Set initial tip percentage to zero.
        tipPercentageTf.text = "0";
        
        //set initial amount-per-head to total amount because default no. of people is set to 1.
        amountPerHeadLbl.text = totalAmount.formateTo(2);
        
        //Set slider to zero.
        tipPercentageSlider.value = 0;
        
        noOfPeopleTf.loadDropdownData(data: Array(1...10).map({String($0)}), onSelect: { (value) in
            self.noOfPeopleTf.text = value;
            if let peopleCount = Int(value) {
                self.viewModel.numberOfPeople = peopleCount;
            }
        },autoUpdateTextField:false)
        
        //End editting on tapping main view.
        addEndEdittingOnTap(view: self.view);
        
    }
    
    /// Initialize ViewModel
    func initVM() {
        
        viewModel.totalAmount = self.totalAmount;
        
        // Closure to show alerts.
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( title: "",message: message )                }
            }
        }
        
        //Clouser to set amount per head into the label.It is called when the user changes the no. of people or the percentage of tip.
        viewModel.setAmountPerHead = { [weak self] (amount) in
            DispatchQueue.main.async {
                self?.amountPerHeadLbl.text = amount.formateTo(2);
            }
        }
        
        //Update corrsponding views according to the updated tip percentage
        viewModel.tipPercentUpdated = { [weak self] (value,isSourceSlider) in
            DispatchQueue.main.async {
                if isSourceSlider {
                    self?.tipPercentageTf.text = value.formateTo(2);
                }else{
                    self?.tipPercentageSlider.value = Float(value);
                }
            }
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        viewModel.updateTipPercentage(value:String((sender as! UISlider).value), isSourceSlider:true);
    }
    
    @IBAction func textFieldEdittingChanged(_ sender: Any) {
        viewModel.updateTipPercentage(value:(sender as! UITextField).text?.trimmingCharacters(in: .whitespacesAndNewlines),isSourceSlider:false);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

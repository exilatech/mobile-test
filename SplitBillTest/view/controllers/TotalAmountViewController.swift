//
//  ViewController.swift
//  SplitBillTest
//
//  Created by Waseem Ahmed on 7/11/18.
//  Copyright © 2018 Waseem Ahmed. All rights reserved.
//

import UIKit

class TotalAmountViewController: UIViewController {
    
    
    @IBOutlet weak var enterAmountLbl: UILabel!
    @IBOutlet weak var amountTf: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
    
    lazy var viewModel: TotalAmountViewModel = {
        return TotalAmountViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initView()
        
        initVM();
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.amountTf.becomeFirstResponder()
    }
    
    func initView() {
        enterAmountLbl.textColor = Theme.curr().titleTextColor;
        amountTf.textColor = Theme.curr().subtitleTextColor;
        continueBtn.setTitleColor(Theme.curr().secondaryColor, for: .normal);
        continueBtn.backgroundColor = Theme.curr().primaryColor
    }
    
    func initVM() {
        viewModel.showAlertClosure = { [weak self] () in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert( title: "",message: message )
                }
            }
        }
    }
    
    @IBAction func continueBtnPressed(_ sender: UIButton) {
        if(viewModel.totalAmount <= 0){
            viewModel.alertMessage = "You must enter some amount to continue";
        }else{
            self.performSegue(withIdentifier: "detailSegue", sender: viewModel.totalAmount);
        }
    }
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        viewModel.updateTotalAmount(value:sender.text?.trimmingCharacters(in: .whitespacesAndNewlines))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        if segue.destination is DetailViewController {
            let dest = segue.destination as! DetailViewController;
            dest.totalAmount = sender as! Double;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


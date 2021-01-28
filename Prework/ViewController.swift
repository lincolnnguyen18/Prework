//
//  ViewController.swift
//  Prework
//
//  Created by Lincoln Nguyen on 1/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Hello")
        // test!
    }

    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // tip *= percentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update total label
        totalLabel.text = String(format: "$%.2f", total)
    }
}

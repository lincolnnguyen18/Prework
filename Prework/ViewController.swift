//
//  ViewController.swift
//  Prework
//
//  Created by Lincoln Nguyen on 1/28/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties and Setup
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var bill = 0.0
    var tip = 0.0
    var tipPercentages = [0.15, 0.18, 0.2]
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        billAmountTextField.delegate = self
        billAmountTextField.becomeFirstResponder()
        refreshTipControl()
        refreshTipAndTotal()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: Text Field Delegate Actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        billAmountTextField.resignFirstResponder()
        bill = Double(billAmountTextField.text!) ?? 0
        recalculateTip()
        refreshTipAndTotal()
        return true
    }
    
    // MARK: Actions
    @IBAction func calculateTip(_ sender: Any) {
        recalculateTip()
        refreshTipAndTotal()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let settingsView = segue.destination as? SettingsViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        settingsView.levels = tipPercentages
    }
    @IBAction func unwindToMainView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? SettingsViewController {
            tipPercentages = sourceViewController.levels
            saveSettings()
            recalculateTip()
            refreshTipControl()
            refreshTipAndTotal()
        }
    }
    
    // MARK: Private Methods
    private func recalculateTip() {
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
    }
    private func refreshTipAndTotal() {
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", bill + tip)
    }
    private func refreshTipControl() {
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[0]*100)), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[1]*100)), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%d%%", Int(tipPercentages[2]*100)), forSegmentAt: 2)
    }
    private func saveSettings() {
        UserDefaults.standard.set(tipPercentages, forKey: "tipPercentages")
    }
    private func loadSettings() {
        tipPercentages = UserDefaults.standard.array(forKey: "tipPercentages") as? [Double] ?? [0.15, 0.18, 0.2]
    }
}

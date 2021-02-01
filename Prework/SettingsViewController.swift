//
//  SettingsViewController.swift
//  Prework
//
//  Created by Lincoln Nguyen on 1/28/21.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties and Setup
    @IBOutlet weak var level1TextField: UITextField!
    @IBOutlet weak var level2TextField: UITextField!
    @IBOutlet weak var level3TextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var levels = [Double]()
    override func viewDidLoad() {
        super.viewDidLoad()
        level1TextField.delegate = self
        level2TextField.delegate = self
        level3TextField.delegate = self
        level1TextField.text = String(format: "%.2f", levels[0])
        level2TextField.text = String(format: "%.2f", levels[1])
        level3TextField.text = String(format: "%.2f", levels[2])
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: Text Field Delegate Actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        levels[0] = formatter.number(from: level1TextField.text ?? "")?.doubleValue ?? levels[0]
        levels[1] = formatter.number(from: level2TextField.text ?? "")?.doubleValue ?? levels[1]
        levels[2] = formatter.number(from: level3TextField.text ?? "")?.doubleValue ?? levels[2]
        view.endEditing(true)
        return true
    }
}

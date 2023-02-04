//
//  ViewController.swift
//  qualPorcentagem
//
//  Created by Vanessa on 04/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialValueTextField: UITextField!
    @IBOutlet weak var finalValueTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialValueTextField.keyboardType = .numberPad
        finalValueTextField.keyboardType = .numberPad
        calculateButton.isEnabled = false
        
        self.initialValueTextField.delegate = self
        self.finalValueTextField.delegate = self
        
    }
    
    func calculatePercent() -> Double{
        var initialValue: Double = 0
        var finalValue :Double = 0
        
        initialValue = Double(initialValueTextField.text!) ?? 0
        finalValue = Double(finalValueTextField.text!) ?? 0
        
        var calculate = ((finalValue - initialValue) / initialValue) * 100
        return calculate
    }
    
    func resultPercent() -> String {
        let result = calculatePercent()
        
        if result >= 0{
            return "acréscimo de:"
        }
        return "decréscimo de:"
    }
    
    func allFieldsFilled() {
        if initialValueTextField.text != "" && finalValueTextField.text != ""{
            calculateButton.isEnabled = true
        } else {
            calculateButton.isEnabled = false
        }
    }

    @IBAction func tappedCalculatedButton(_ sender: UIButton) {
        let resultView: CalculateResultViewController? = UIStoryboard(name: "CalculateResultViewController", bundle: nil).instantiateViewController(identifier: "CalculateResultViewController") {coder in return CalculateResultViewController(coder: coder, value: self.calculatePercent(), result: (self.resultPercent()))}
        self.present(resultView ?? UIViewController(), animated: true)
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.yellow.cgColor
        textField.layer.borderWidth = 1
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        allFieldsFilled()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

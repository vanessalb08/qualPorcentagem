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
    
    func calculatePercent(initialValue: String, finalValue: String) -> Double{
        guard let firstValue = Double(initialValue), let secondValue = Double(finalValue) else{
            return 0.0
        }
        let difference = secondValue - firstValue
        let percentageDifference = (difference / firstValue) * 100
        return percentageDifference
    }
    
    func resultPercent(initialValue: String, finalValue: String) -> String {
        let result = calculatePercent(initialValue: initialValue, finalValue: finalValue)
        
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
        let resultView: CalculateResultViewController? = UIStoryboard(name: "CalculateResultViewController", bundle: nil).instantiateViewController(identifier: "CalculateResultViewController") { [self]coder in return CalculateResultViewController(coder: coder, value: self.calculatePercent(initialValue: initialValueTextField.text ?? "", finalValue: finalValueTextField.text ?? ""), result: (self.resultPercent(initialValue: initialValueTextField.text ?? "", finalValue: finalValueTextField.text ?? "")))}
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

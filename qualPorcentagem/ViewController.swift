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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adicionar estilização aos textFields(teclado, etc)
        // guard let para remover os unraped
        // impedir a divisão por 0 - obrigar a informar os 2 campos para ativar o botão
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

    @IBAction func tappedCalculatedButton(_ sender: UIButton) {
        let resultView: CalculateResultViewController? = UIStoryboard(name: "CalculateResultViewController", bundle: nil).instantiateViewController(identifier: "CalculateResultViewController") {coder in return CalculateResultViewController(coder: coder, value: self.calculatePercent(), result: (self.resultPercent()))}
        self.present(resultView ?? UIViewController(), animated: true)
    }
    
}


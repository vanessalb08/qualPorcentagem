//
//  CalculateResultViewController.swift
//  qualPorcentagem
//
//  Created by Vanessa on 04/02/23.
//

import UIKit

class CalculateResultViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    let value: Double
    let result: String
    
    init?(coder: NSCoder, value: Double, result: String) {
        self.value = value
        self.result = result
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel.text = String(value)
        resultLabel.text = result
    }
    
}

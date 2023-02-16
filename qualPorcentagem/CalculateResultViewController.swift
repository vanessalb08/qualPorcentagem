//
//  CalculateResultViewController.swift
//  qualPorcentagem
//
//  Created by Vanessa on 04/02/23.
//

import UIKit

class CalculateResultViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    
    let value: String
    
    init?(coder: NSCoder, value: String) {
        self.value = value
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueLabel.text = String(value)
    }
    
}

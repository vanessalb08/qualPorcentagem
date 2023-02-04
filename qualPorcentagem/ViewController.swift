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
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCalculatedButton(_ sender: UIButton) {
        let resultView: CalculateResultViewController? = UIStoryboard(name: "CalculateResultViewController", bundle: nil).instantiateViewController(withIdentifier: "CalculateResultViewController") as? CalculateResultViewController
        self.present(resultView ?? UIViewController(), animated: true)
    }
    
}


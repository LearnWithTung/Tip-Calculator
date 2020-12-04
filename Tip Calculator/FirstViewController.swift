//
//  FirstViewController.swift
//  Tip Calculator
//
//  Created by namtrinh on 03/12/2020.
//

import UIKit

class FirstViewController: UIViewController {
   
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    
    var number1: Float = 0.0
    var number2: Float = 0.0
    var number3: Float = 0.0
    var result: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handelCalculateTipButton(_ sender: Any) {
        guard let first = firstTextField.text,
              let second = secondTextField.text,
              let third = thirdTextField.text else {
            return
        }
        number1 = Float(first) ?? 0
        number2 = Float(second) ?? 0
        number3 = Float(third) ?? 0
        result = number1 + number2 + number3 + 0.2*number1 + 0.1*number2 + 0.1*number3
        resultTextField.text = "$"+String(result)
    }

}

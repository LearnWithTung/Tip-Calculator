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
        firstTextField.addTarget(self, action: #selector(FirstViewController.textField1DidChange(_:)), for: .editingDidEnd)
        firstTextField.addTarget(self, action: #selector(FirstViewController.ClearText1(_:)), for: .allTouchEvents)
        secondTextField.addTarget(self, action: #selector(FirstViewController.textField2DidChange(_:)), for: .editingDidEnd)
        secondTextField.addTarget(self, action: #selector(FirstViewController.ClearText2(_:)), for: .allTouchEvents)
        thirdTextField.addTarget(self, action: #selector(FirstViewController.textField3DidChange(_:)), for: .editingDidEnd)
        thirdTextField.addTarget(self, action: #selector(FirstViewController.ClearText3(_:)), for: .allTouchEvents)
    }
    @objc func ClearText1(_ textField: UITextField) {
        firstTextField.text = ""
    }
    @objc func ClearText2(_ textField: UITextField) {
        secondTextField.text = ""
    }
    @objc func ClearText3(_ textField: UITextField) {
        thirdTextField.text = ""
    }
    @objc func textField1DidChange(_ textField: UITextField) {
        number1 = Float(firstTextField.text!) ?? 0
        firstTextField.text = "$"+firstTextField.text!
    }

    @objc func textField2DidChange(_ textField: UITextField) {
        number2 = Float(secondTextField.text!) ?? 0
        secondTextField.text = "$"+secondTextField.text!
    }

    @objc func textField3DidChange(_ textField: UITextField) {
        number3 = Float(thirdTextField.text!) ?? 0
        thirdTextField.text = "$"+thirdTextField.text!
    }

    @IBAction func handelCalculateTipButton(_ sender: Any) {
        result = number1 + number2 + number3 + 0.2*number1 + 0.1*number2 + 0.1*number3
        resultTextField.text = "$"+String(result)
    }

}

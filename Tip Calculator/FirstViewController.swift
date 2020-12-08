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
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        dismissKeyboard()

    }

    @IBAction func handelCalculateTipButton(_ sender: Any) {
        if let txt1 = firstTextField.text {
            print(txt1)
            number1 = Float(txt1.dropFirst()) ?? 0
        }
        if let txt2 = secondTextField.text{
            number2 = Float(txt2.dropFirst()) ?? 0
        }
        if let txt3 = thirdTextField.text{
            number3 = Float(txt3.dropFirst()) ?? 0
        }
        result = number1 + number2 + number3 + 0.2*number1 + 0.1*number2 + 0.1*number3
        resultTextField.text = "$"+String(result)
    }

}

extension FirstViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dotString = "."
        let character = "$"
        if textField == firstTextField {
            if let text = firstTextField.text{
                if !text.contains(character){
                    firstTextField.text = "\(character)\(text)"
                }
                let isDeleteKey = string.isEmpty
                if !isDeleteKey {
                    if text.contains(dotString) {
                        if text.components(separatedBy: dotString)[1].count == 2 || string == "."  {
                            return false
                        }
                    }
                }
            }
        }
        else if textField == secondTextField {
            if let text = secondTextField.text{
                print(text)
                if !text.contains(character){
                    secondTextField.text = "\(character)\(text)"
                }
                let isDeleteKey = string.isEmpty
                if !isDeleteKey {
                    if text.contains(dotString) {
                        if text.components(separatedBy: dotString)[1].count == 2 || string == "."  {
                            return false
                        }
                    }
                }
            }
        }
        else if textField == thirdTextField {
            if let text = thirdTextField.text{
                print(text)
                if !text.contains(character){
                    thirdTextField.text = "\(character)\(text)"
                }
                let isDeleteKey = string.isEmpty
                if !isDeleteKey {
                    if text.contains(dotString) {
                        if text.components(separatedBy: dotString)[1].count == 2 || string == "."  {
                            return false
                        }
                    }
                }
            }

        }
        return true
    }
    
}

extension UIViewController {
    func dismissKeyboard() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
        }
        
        @objc private func dismissKeyboardTouchOutside() {
           view.endEditing(true)
        }
}

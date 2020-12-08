//
//  ViewController.swift
//  Tip Calculator
//
//  Created by ThangLai on 02/12/2 Reiwa.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstPercentTextfield: UITextField!
    @IBOutlet weak var secondPercentTextfield: UITextField!
    @IBOutlet weak var thirdPercentTextfield: UITextField!
    @IBOutlet weak var totalBillTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstPercentTextfield.delegate = self
        secondPercentTextfield.delegate = self
        thirdPercentTextfield.delegate = self
        totalBillTextField.delegate = self

        totalBillTextField.isUserInteractionEnabled = false       
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func calculateTipsPressed(_ sender: Any) {
        var totalBill: Float = 0.0
        
//        if let text = firstPercentTextfield.text {
//            if text.isEmpty {
//                first
//
//            }
//            else {
//
//            }
//        }
        
        let firstBill = firstPercentTextfield.text!.isEmpty ? "0" : firstPercentTextfield.text!.components(separatedBy: "$")[1].trimmingCharacters(in: .whitespacesAndNewlines)
        let secondBill = secondPercentTextfield.text!.isEmpty ? "0" : secondPercentTextfield.text!.components(separatedBy: "$")[1].trimmingCharacters(in: .whitespacesAndNewlines)
        let thirdBill = thirdPercentTextfield.text!.isEmpty ? "0" : thirdPercentTextfield.text!.components(separatedBy: "$")[1].trimmingCharacters(in: .whitespacesAndNewlines)
        
        totalBill = Float(firstBill)! * 1.2 + Float(secondBill)! * 1.1 + Float(thirdBill)! * 1.1
        print(totalBill)
        totalBillTextField.text = String(format: "$ %.2f", totalBill) //"$ \(totalBill)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstPercentTextfield.resignFirstResponder()
        self.secondPercentTextfield.resignFirstResponder()
        self.thirdPercentTextfield.resignFirstResponder()
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstPercentTextfield {
            print("Done first percent!")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dotString = "."
        let character = "$"

        if textField == firstPercentTextfield {
            if let text = textField.text{
                
                if !text.contains(character){
                    firstPercentTextfield.text = "\(character) \(text)"
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
        else if textField == secondPercentTextfield {
            if let text = textField.text{
                
                if !text.contains(character){
                    secondPercentTextfield.text = "\(character) \(text)"
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
        else {
            if let text = textField.text{
                
                if !text.contains(character){
                    thirdPercentTextfield.text = "\(character) \(text)"
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

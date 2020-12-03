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
    
    
    @IBAction func calculateTipsPressed(_ sender: Any) {
        var totalBill: Float = 0.0
        
        let firstBill = firstPercentTextfield.text!.isEmpty ? "0" : firstPercentTextfield.text!
        let secondBill = secondPercentTextfield.text!.isEmpty ? "0" : secondPercentTextfield.text!
        let thirdBill = thirdPercentTextfield.text!.isEmpty ? "0" : thirdPercentTextfield.text!
        
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

}

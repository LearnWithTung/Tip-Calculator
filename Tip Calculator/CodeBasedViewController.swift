//
//  CodeBasedViewController.swift
//  Tip Calculator
//
//  Created by ThangLai on 03/12/2 Reiwa.
//

import UIKit

class CodeBasedViewController: UIViewController {
    
    let firstPercentageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "$ 0.0"
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.background = #imageLiteral(resourceName: "Vector 1")
        return textField
    }()
    let secondPercentageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "$ 0.0"
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.background = #imageLiteral(resourceName: "Vector 1")
        return textField
    }()
    let thirdPercentageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "$ 0.0"
        textField.textAlignment = .right
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.keyboardType = UIKeyboardType.numbersAndPunctuation
        textField.background = #imageLiteral(resourceName: "Vector 1")
        return textField
    }()
    
    let yourBillTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "$ 0.0"
        textField.borderStyle = .roundedRect
        textField.textAlignment = .right
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    let calculateButton: UIButton = {
        let calculateButton = UIButton()
        calculateButton.backgroundColor = #colorLiteral(red: 1, green: 0.8235294118, blue: 0, alpha: 1)
        calculateButton.setTitle("CALCULATE TIP", for: .normal)
        calculateButton.titleLabel?.textColor = .white
        calculateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        return calculateButton
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        firstPercentageTextField.delegate = self
        secondPercentageTextField.delegate = self
        thirdPercentageTextField.delegate = self
        
        calculateButton.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    }
    
    @objc func calculatePressed(_ sender: AnyObject?) {
        print("pressed!!")
        var totalBill: Float = 0.0
        
        let firstBill = firstPercentageTextField.text!.isEmpty ? "0" : firstPercentageTextField.text!
        let secondBill = secondPercentageTextField.text!.isEmpty ? "0" : secondPercentageTextField.text!
        let thirdBill = thirdPercentageTextField.text!.isEmpty ? "0" : thirdPercentageTextField.text!
        
        totalBill = Float(firstBill)! * 1.2 + Float(secondBill)! * 1.1 + Float(thirdBill)! * 1.1
        print(totalBill)
        yourBillTextField.text = String(format: "$ %.2f", totalBill)
    }
    
    private func setup() {
        
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fillEqually
        
        let upperView = UIView()
//        upperView.backgroundColor = .red
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        upperView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: upperView.topAnchor, constant: 40),
            iconImageView.centerXAnchor.constraint(equalTo: upperView.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 170),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
        iconImageView.image = #imageLiteral(resourceName: "comvecteezy347930 2")
        
        let percenStackView = UIStackView()
        percenStackView.axis = NSLayoutConstraint.Axis.horizontal
        percenStackView.distribution = UIStackView.Distribution.fillEqually
        percenStackView.spacing = 20
        percenStackView.translatesAutoresizingMaskIntoConstraints = false
        upperView.addSubview(percenStackView)
        NSLayoutConstraint.activate([
            percenStackView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: 20),
            percenStackView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -20),
            percenStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 50),
            percenStackView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -30)
            
        ])
        
        let firstPercentageView = UIView()
        let firstPercentageLabel = UILabel()
        firstPercentageLabel.text = "20%"
        firstPercentageLabel.font = UIFont.systemFont(ofSize: 15)
        firstPercentageLabel.textColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 1)
        firstPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        firstPercentageView.addSubview(firstPercentageTextField)
        firstPercentageView.addSubview(firstPercentageLabel)
        NSLayoutConstraint.activate([
            firstPercentageTextField.leadingAnchor.constraint(equalTo: firstPercentageView.leadingAnchor),
            firstPercentageTextField.trailingAnchor.constraint(equalTo: firstPercentageView.trailingAnchor),
            firstPercentageTextField.heightAnchor.constraint(equalToConstant: 72),
            firstPercentageLabel.topAnchor.constraint(equalTo: firstPercentageTextField.bottomAnchor, constant: 1),
            firstPercentageLabel.centerXAnchor.constraint(equalTo: firstPercentageTextField.centerXAnchor)
        ])
        
        let secondPercentageView = UIView()
        let secondPercentageLabel = UILabel()
        secondPercentageLabel.text = "10%"
        secondPercentageLabel.font = UIFont.systemFont(ofSize: 15)
        secondPercentageLabel.textColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 1)
        secondPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        secondPercentageView.addSubview(secondPercentageTextField)
        secondPercentageView.addSubview(secondPercentageLabel)
        NSLayoutConstraint.activate([
            secondPercentageTextField.leadingAnchor.constraint(equalTo: secondPercentageView.leadingAnchor),
            secondPercentageTextField.trailingAnchor.constraint(equalTo: secondPercentageView.trailingAnchor),
            secondPercentageTextField.heightAnchor.constraint(equalToConstant: 72),

            secondPercentageLabel.topAnchor.constraint(equalTo: secondPercentageTextField.bottomAnchor, constant: 1),
            secondPercentageLabel.centerXAnchor.constraint(equalTo: secondPercentageTextField.centerXAnchor)
        ])
        
        let thirdPercentageView = UIView()
        let thirdPercentageLabel = UILabel()
        thirdPercentageLabel.text = "10%"
        thirdPercentageLabel.font = UIFont.systemFont(ofSize: 15)
        thirdPercentageLabel.textColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 1)
        thirdPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdPercentageView.addSubview(thirdPercentageTextField)
        thirdPercentageView.addSubview(thirdPercentageLabel)
        NSLayoutConstraint.activate([
            thirdPercentageTextField.leadingAnchor.constraint(equalTo: thirdPercentageView.leadingAnchor),
            thirdPercentageTextField.trailingAnchor.constraint(equalTo: thirdPercentageView.trailingAnchor),
            thirdPercentageTextField.heightAnchor.constraint(equalToConstant: 72),
            
            thirdPercentageLabel.topAnchor.constraint(equalTo: thirdPercentageTextField.bottomAnchor, constant: 1),
            thirdPercentageLabel.centerXAnchor.constraint(equalTo: thirdPercentageTextField.centerXAnchor)
        ])
        
        percenStackView.addArrangedSubview(firstPercentageView)
        percenStackView.addArrangedSubview(secondPercentageView)
        percenStackView.addArrangedSubview(thirdPercentageView)
        
        
        let bottomStackView = UIStackView()
        bottomStackView.axis = NSLayoutConstraint.Axis.vertical
        bottomStackView.distribution = UIStackView.Distribution.fillEqually
        
        let yourBillView = UIView()
        let yourBillLabel = UILabel()
        yourBillLabel.text = "Your Bill"
        yourBillLabel.textColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 1)
        
        yourBillLabel.translatesAutoresizingMaskIntoConstraints = false
        yourBillView.addSubview(yourBillLabel)
        yourBillView.addSubview(yourBillTextField)
        NSLayoutConstraint.activate([
            yourBillTextField.leadingAnchor.constraint(equalTo: yourBillView.leadingAnchor, constant: 20),
            yourBillTextField.trailingAnchor.constraint(equalTo: yourBillView.trailingAnchor, constant: -20),
            yourBillTextField.heightAnchor.constraint(equalToConstant: 84),
            yourBillTextField.bottomAnchor.constraint(equalTo: yourBillView.bottomAnchor, constant: -45)
            
        ])
        NSLayoutConstraint.activate([
            yourBillLabel.leadingAnchor.constraint(equalTo: yourBillTextField.leadingAnchor),
            yourBillLabel.bottomAnchor.constraint(equalTo: yourBillTextField.topAnchor, constant: -15),
            yourBillLabel.heightAnchor.constraint(equalToConstant: 23),
            yourBillLabel.widthAnchor.constraint(equalToConstant: 62)
            
        ])
        let calculateView = UIView()

        calculateView.addSubview(calculateButton)
        NSLayoutConstraint.activate([
            calculateButton.leadingAnchor.constraint(equalTo: calculateView.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: calculateView.trailingAnchor, constant: -20),
            calculateButton.topAnchor.constraint(equalTo: calculateView.topAnchor, constant: 60),
            calculateButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        bottomStackView.addArrangedSubview(yourBillView)
        bottomStackView.addArrangedSubview(calculateView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        stackView.addArrangedSubview(upperView)
        stackView.addArrangedSubview(bottomStackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
//        let bottomEdgeView = UIImageView()
//        bottomEdgeView.translatesAutoresizingMaskIntoConstraints = false
//        bottomEdgeView.image = UIImage(named: "BottomEdge 1-1")
//        self.view.addSubview(bottomEdgeView)
//        NSLayoutConstraint.activate([
//            bottomEdgeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bottomEdgeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bottomEdgeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
        
        
    }
}

extension CodeBasedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.firstPercentageTextField.resignFirstResponder()
        self.secondPercentageTextField.resignFirstResponder()
        self.thirdPercentageTextField.resignFirstResponder()
        return true
    }
}

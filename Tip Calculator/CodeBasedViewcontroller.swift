//
//  CodeBasedViewcontroller.swift
//  Tip Calculator
//
//  Created by namtrinh on 04/12/2020.
//

import UIKit

class CodeBasedViewcontroller: UIViewController {
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"image")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let firstTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "$0"
        text.borderStyle = .roundedRect
        text.font = UIFont.systemFont(ofSize: 30)
        text.textAlignment = .center
        text.background = UIImage(named: "vector4")
        return text
    }()
    
    let secondTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "$0"
        text.borderStyle = .roundedRect
        text.font = UIFont.systemFont(ofSize: 30)
        text.textAlignment = .center
        text.background = UIImage(named: "vector4")
        return text
    }()
    
    let thirdTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "$0"
        text.borderStyle = .roundedRect
        text.font = UIFont.systemFont(ofSize: 30)
        text.textAlignment = .center
        text.background = UIImage(named: "vector4")
        return text
    }()
    
    let label1: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "20%"
        lb.textAlignment = .center
        return lb
    }()
    
    let label2: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "10%"
        lb.textAlignment = .center
        return lb
    }()
    
    let label3: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "10%"
        lb.textAlignment = .center
        return lb
    }()
    
    let yourBillLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = UIColor.lightGray
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.text = "Your Bill"
        lb.textAlignment = .left
        return lb
    }()
    
    let yourBillTextFied: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "$0"
        text.borderStyle = .roundedRect
        text.font = UIFont.systemFont(ofSize: 30)
        text.textAlignment = .right
        text.isUserInteractionEnabled = false
        text.layer.borderWidth = 1
        return text
    }()

    let calculateButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemYellow
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("CALCULATE TIP", for: .normal)
        btn.addTarget(self, action: #selector(handelCalculateTip), for: .touchUpInside)
        return btn
    }()
    
    let stackView1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackView2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var number1: Float = 0.0
    var number2: Float = 0.0
    var number3: Float = 0.0
    var result: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        custom()
        customStack()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: view.frame.width/4,
                                 y: 40,
                                 width: view.frame.width/2,
                                 height: view.frame.width/2)
    }
    
    @objc private func handelCalculateTip(){
        guard let first = firstTextField.text,
              let second = secondTextField.text,
              let third = thirdTextField.text else {
            return
        }
        number1 = Float(first) ?? 0
        number2 = Float(second) ?? 0
        number3 = Float(third) ?? 0
        result = number1 + number2 + number3 + 0.2*number1 + 0.1*number2 + 0.1*number3
        yourBillTextFied.text = "$"+String(result)
    }
    
    private func addSubViews(){
        view.addSubview(stackView1)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(thirdTextField)
        view.addSubview(imageView)
        view.addSubview(stackView2)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(calculateButton)
        view.addSubview(yourBillTextFied)
        view.addSubview(yourBillLabel)
    }
    
    private func customStack(){
        stackView1.addArrangedSubview(firstTextField)
        stackView1.addArrangedSubview(secondTextField)
        stackView1.addArrangedSubview(thirdTextField)
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.alignment = .fill
        stackView1.spacing = 20
        stackView2.addArrangedSubview(label1)
        stackView2.addArrangedSubview(label2)
        stackView2.addArrangedSubview(label3)
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.alignment = .fill
        stackView2.spacing = 20
    }
    
    private func custom(){
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView1.heightAnchor.constraint(equalToConstant: 72),
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 10),
            stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView2.heightAnchor.constraint(equalToConstant: 30),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor ,constant: -50),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 70),
            yourBillTextFied.bottomAnchor.constraint(equalTo: calculateButton.topAnchor ,constant: -20),
            yourBillTextFied.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yourBillTextFied.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            yourBillTextFied.heightAnchor.constraint(equalToConstant: 70),
            yourBillLabel.bottomAnchor.constraint(equalTo: yourBillTextFied.topAnchor ,constant: -10),
            yourBillLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yourBillLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            yourBillLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}

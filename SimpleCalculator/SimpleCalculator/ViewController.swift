//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Kadir Aydınlı on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var secondText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sumClick(_ sender: Any) {
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                resultText.text = String(firstNumber + secondNumber)
            }
        }
    }
    
    @IBAction func minusClick(_ sender: Any) {
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                resultText.text = String(firstNumber - secondNumber)
            }
        }
    }
    
    @IBAction func multiplyClick(_ sender: Any) {
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                resultText.text = String(firstNumber * secondNumber)
            }
        }
    }
    
    @IBAction func divideClick(_ sender: Any) {
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                resultText.text = String(firstNumber / secondNumber)
            }
        }
    }
}


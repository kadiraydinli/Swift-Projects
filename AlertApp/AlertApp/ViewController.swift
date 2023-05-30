//
//  ViewController.swift
//  AlertApp
//
//  Created by Kadir Aydınlı on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordAgainField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }


    @IBAction func signUpButton(_ sender: Any) {
        if usernameField.text == "" {
            alert(title: "Error", message: "User not found")
        } else if passwordField.text == "" {
            alert(title: "Error", message: "Password not found")
        } else if passwordField.text != passwordAgainField.text {
            alert(title: "Error", message: "Password do not match")
        } else {
            alert(title: "Success", message: "User OK")
        }
    }
}


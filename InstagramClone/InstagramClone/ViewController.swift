//
//  ViewController.swift
//  InstagramClone
//
//  Created by Kadir Aydınlı on 15.12.2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alertModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    @IBAction func signInButton(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.alertModal(title: "Error", message: error?.localizedDescription ?? "Firebase error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            alertModal(title: "Error", message: "Please enter email and password")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil {
                    self.alertModal(title: "Error", message: error?.localizedDescription ?? "Firebase error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            alertModal(title: "Error", message: "Please enter email and password")
        }
    }
    
}


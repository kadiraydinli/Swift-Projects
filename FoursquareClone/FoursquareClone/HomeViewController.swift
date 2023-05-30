//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }

    @IBAction func signInButton(_ sender: Any) {
        if usernameField.text != "" && passwordField.text != "" {
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { user, error in
                if error != nil {
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Parse error")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            self.showAlert(title: "Check it", message: "Please check your email and password!")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if usernameField.text != "" && passwordField.text != "" {
            let user = PFUser()
            user.username = usernameField.text!
            user.password = passwordField.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Parse error")
                } else {
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            self.showAlert(title: "Error", message: "Need to fill in email and password")
        }
    }
}


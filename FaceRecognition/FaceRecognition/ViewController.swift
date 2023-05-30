//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Kadir Aydınlı on 14.12.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func button(_ sender: Any) {
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Who are you?") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.resultText.text = "Error!"
                    }
                }
            }
        }
    }
}


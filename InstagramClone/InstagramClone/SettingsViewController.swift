//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Kadir Aydınlı on 15.12.2022.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toMainVC", sender: nil)
        } catch {
            print("error")
        }
    }

}

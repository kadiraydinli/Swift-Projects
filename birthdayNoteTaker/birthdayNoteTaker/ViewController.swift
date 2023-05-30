//
//  ViewController.swift
//  birthdayNoteTaker
//
//  Created by Kadir Aydınlı on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var birthdayText: UILabel!
    
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameText.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayText.text = "Birthday: \(newBirthday)"
        }
    }


    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(nameField.text, forKey: "name")
        UserDefaults.standard.set(birthdayField.text, forKey: "birthday")
        
        nameText.text = "Name: \(nameField.text!)"
        birthdayText.text = "Birthday: \(birthdayField.text!)"
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameText.text = "Name:"
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayText.text = "Birthday:"
        }
    }
}


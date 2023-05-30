//
//  ViewController.swift
//  SequeApp
//
//  Created by Kadir Aydınlı on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let alert = UIAlertController(title: "Hello World", message: "view did disappear", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func nextButton(_ sender: Any) {
        userName = textField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.myName = userName
        }
    }
}


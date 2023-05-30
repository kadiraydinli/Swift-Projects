//
//  SecondViewController.swift
//  SequeApp
//
//  Created by Kadir Aydınlı on 20.11.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = myName
    }
}

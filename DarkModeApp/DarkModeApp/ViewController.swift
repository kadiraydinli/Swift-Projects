//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Kadir Aydınlı on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Telefonun modu yerine seçilen moddda çalışır
        // overrideUserInterfaceStyle = .light
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /*let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            button.tintColor = UIColor.white
        } else {
            button.tintColor = UIColor.blue
        }*/
    }

}


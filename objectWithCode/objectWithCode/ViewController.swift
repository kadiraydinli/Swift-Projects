//
//  ViewController.swift
//  objectWithCode
//
//  Created by Kadir Aydınlı on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.textColor = .blue
        myLabel.backgroundColor = .cyan
        myLabel.frame = CGRect(x: width / 2 - width * 0.8 / 2, y: height / 2 - 50 / 2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("Click", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        myButton.backgroundColor = .black
        myButton.frame = CGRect(x: width * 0.4, y: height * 0.7, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside)
    }


    @objc func myAction() {
        myLabel.text = "Tapped"
    }
}


//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Kadir Aydınlı on 21.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var isChangeImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic() {
        if isChangeImage {
            imageView.image = UIImage(named: "image")
        } else {
            imageView.image = UIImage(named: "image2")
        }
        
        isChangeImage = !isChangeImage
    }
}


//
//  DetailViewController.swift
//  SimpsonBook
//
//  Created by Kadir Aydınlı on 26.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
    
}

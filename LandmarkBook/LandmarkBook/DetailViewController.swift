//
//  DetailViewController.swift
//  LandmarkBook
//
//  Created by Kadir Aydınlı on 22.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

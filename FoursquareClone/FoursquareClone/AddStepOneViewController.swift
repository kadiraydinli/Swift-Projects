//
//  AddStepOneViewController.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import UIKit

class AddStepOneViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeAtmosphereField: UITextField!
    @IBOutlet weak var placeTypeField: UITextField!
    @IBOutlet weak var placeNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chosenImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    @objc func chosenImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    

    @IBAction func nextButton(_ sender: Any) {
        if placeNameField.text != "" && placeTypeField.text != "" && placeAtmosphereField.text != "" {
            if let chosenImage = imageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameField.text!
                placeModel.placeType = placeTypeField.text!
                placeModel.placeAtmosphere = placeAtmosphereField.text!
                placeModel.placeImage = chosenImage
            }
            
            self.performSegue(withIdentifier: "toAddTwoVC", sender: nil)
        } else {
            self.showAlert(title: "Error", message: "Please all fill")
        }
    }
}

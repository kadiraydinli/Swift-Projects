//
//  UploadViewController.swift
//  InstagramClone
//
//  Created by Kadir Aydınlı on 15.12.2022.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chosenImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chosenImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func alertModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    @IBAction func uploadButton(_ sender: Any) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let mediaFolder = storageRef.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageRef = mediaFolder.child("\(uuid).jpg")
            
            imageRef.putData(data, metadata: nil) { metaData, error in
                if error != nil {
                    self.alertModal(title: "Error", message: error?.localizedDescription ?? "Firebase error")
                } else {
                    imageRef.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreRef: DocumentReference? = nil
                            
                            let data = [
                                "image": imageUrl!,
                                "postedBy": Auth.auth().currentUser!.email!,
                                "comment": self.textField.text!,
                                "date": FieldValue.serverTimestamp(),
                                "likes": 0
                            ] as [String: Any]
                            
                            firestoreRef = firestoreDatabase.collection("Posts").addDocument(data: data, completion: { error in
                                if error != nil {
                                    self.alertModal(title: "Error", message: error?.localizedDescription ?? "Firebase error")
                                } else {
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.textField.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                        }
                    }
                }
            }
        }
    }
}

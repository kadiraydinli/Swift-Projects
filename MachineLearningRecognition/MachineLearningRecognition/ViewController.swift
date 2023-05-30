//
//  ViewController.swift
//  MachineLearningRecognition
//
//  Created by Kadir Aydınlı on 25.12.2022.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var chosenImage = CIImage()
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
        recognizeImage()
    }
    
    func recognizeImage() {
        if let ciImage = CIImage(image: imageView.image!) {
            chosenImage = ciImage
        }
        
        self.resultText.text = "Finding..."
        
        if let model = try? VNCoreMLModel(for: Resnet50().model) {
            let request = VNCoreMLRequest(model: model) { vnrequest, error in
                if let results = vnrequest.results as? [VNClassificationObservation] {
                    let firstResult = results.first
                    
                    DispatchQueue.main.async {
                        let confidenceLevel = (firstResult?.confidence ?? 0) * 100
                        
                        let rounded = Int(confidenceLevel * 100) / 100
                        
                        self.resultText.text = "\(rounded)% it's \(firstResult!.identifier)"
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: chosenImage)
            
            DispatchQueue.global(qos: .userInteractive).async {
                do {
                    try handler.perform([request])
                } catch {
                    print("error")
                }
            }
        }
    }
}


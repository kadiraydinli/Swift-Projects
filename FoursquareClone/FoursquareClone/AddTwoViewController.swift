//
//  AddTwoViewController.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import UIKit
import MapKit
import Parse

class AddTwoViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()

    @IBOutlet weak var mapKitView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButton))

        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveButton))
        
        print(PlaceModel.sharedInstance.placeName)
        
        mapKitView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer: )))
        recognizer.minimumPressDuration = 2
        mapKitView.addGestureRecognizer(recognizer)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            let touches = gestureRecognizer.location(in: self.mapKitView)
            let coordinates = self.mapKitView.convert(touches, toCoordinateFrom: self.mapKitView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = PlaceModel.sharedInstance.placeName
            annotation.subtitle = PlaceModel.sharedInstance.placeType
            
            self.mapKitView.addAnnotation(annotation)
            
            let placeModel = PlaceModel.sharedInstance
            placeModel.placeLatitude = String(coordinates.latitude)
            placeModel.placeLangitude = String(coordinates.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
        let region = MKCoordinateRegion(center: location, span: span)
        mapKitView.setRegion(region, animated: true)
    }
    
    @objc func backButton() {
        self.dismiss(animated: true)
    }
    
    @objc func saveButton() {
        let placeModel = PlaceModel.sharedInstance
        let object = PFObject(className: "Places")
        object["name"] = placeModel.placeName
        object["type"] = placeModel.placeType
        object["atmosphere"] = placeModel.placeAtmosphere
        object["latitude"] = placeModel.placeLatitude
        object["langitude"] = placeModel.placeLangitude
        
        if let image = placeModel.placeImage.jpegData(compressionQuality: 0.5) {
            object["image"] = PFFileObject(name: "image.jpg", data: image)
        }
        
        object.saveInBackground { success, error in
            if error != nil {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "Parse error")
            } else {
                self.performSegue(withIdentifier: "toTableListVC", sender: nil)
            }
        }
    }

}

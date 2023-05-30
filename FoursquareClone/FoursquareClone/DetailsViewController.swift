//
//  DetailsViewController.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import UIKit
import MapKit
import Parse

class DetailsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var chosenPlaceID = ""
    var chosenLatitude = Double()
    var chosenLangitude = Double()

    @IBOutlet weak var placesMapKit: MKMapView!
    @IBOutlet weak var placesAtmosphereText: UILabel!
    @IBOutlet weak var placesTypeText: UILabel!
    @IBOutlet weak var placesNameText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        placesMapKit.delegate = self
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    func getData() {
        let query = PFQuery(className: "Places").whereKey("objectId", equalTo: chosenPlaceID)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.showAlert("Error", error?.localizedDescription ?? "Parse error")
            } else {
                if objects != nil {
                    if objects!.count > 0 {
                        let object = objects![0]
                        
                        if let name = object.object(forKey: "name") as? String {
                            self.placesNameText.text = name
                        }
                        
                        if let type = object.object(forKey: "type") as? String {
                            self.placesTypeText.text = type
                        }
                        
                        if let atmosphere = object.object(forKey: "atmosphere") as? String {
                            self.placesAtmosphereText.text = atmosphere
                        }
                        
                        if let placeLatitude = object.object(forKey: "latitude") as? String {
                            if let latitude = Double(placeLatitude) {
                                self.chosenLatitude = latitude
                            }
                        }
                        
                        if let placeLangitude = object.object(forKey: "langitude") as? String {
                            if let langitude = Double(placeLangitude) {
                                self.chosenLangitude = langitude
                            }
                        }
                        
                        if let imageData = object.object(forKey: "image") as? PFFileObject {
                            imageData.getDataInBackground { data, error in
                                if error != nil {
                                    self.showAlert("Error", error?.localizedDescription ?? "Parse error")
                                } else {
                                    self.imageView.image = UIImage(data: data!)
                                }
                            }
                        }
                        self.setMap()
                    }
                }
            }
        }
    }
    
    func setMap() {
        let location = CLLocationCoordinate2D(latitude: chosenLatitude, longitude: chosenLangitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
        let region = MKCoordinateRegion(center: location, span: span)
        self.placesMapKit.setRegion(region, animated: true)
        
        let annotation =  MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = placesNameText.text
        annotation.subtitle = placesTypeText.text
        
        self.placesMapKit.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let resueId = "pin"
        
        var pinView = placesMapKit.dequeueReusableAnnotationView(withIdentifier: resueId)
        
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: resueId)
            pinView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.chosenLatitude != 0.0 && self.chosenLangitude != 0.0 {
            let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLangitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let mkPlacemark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlacemark)
                        
                        mapItem.name = self.placesNameText.text!
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
                }
            }
        }
    }

}

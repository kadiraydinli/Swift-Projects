//
//  ViewController.swift
//  TravelBook
//
//  Created by Kadir Aydınlı on 12.12.2022.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var choosenLatitude = Double()
    var choosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedTitleID: UUID?
    
    var annotionTitle = ""
    var annotionSubtitle = ""
    var annotionLatitude = Double()
    var annotionLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer: )))
        gestureRecognizer.minimumPressDuration = 2
        
        mapView.addGestureRecognizer(gestureRecognizer)
        
        if selectedTitle != "" {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString =  selectedTitleID!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let title = result.value(forKey: "title") as? String {
                            annotionTitle = title
                        }
                        
                        if let subtitle = result.value(forKey: "subtitle") as? String {
                            annotionSubtitle = subtitle
                        }
                        
                        if let latitude = result.value(forKey: "latitude") as? Double {
                            annotionLatitude = latitude
                        }
                        
                        if let longitude = result.value(forKey: "longitude") as? Double {
                            annotionLongitude = longitude
                        }
                        
                        let annotion = MKPointAnnotation()
                        annotion.title = annotionTitle
                        annotion.subtitle = annotionSubtitle
                        let coordinate = CLLocationCoordinate2D(latitude: annotionLatitude, longitude: annotionLongitude)
                        annotion.coordinate = coordinate
                        
                        mapView.addAnnotation(annotion)
                        
                        nameText.text = annotionTitle
                        commentText.text = annotionSubtitle
                        
                        locationManager.stopUpdatingHeading()
                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        let region = MKCoordinateRegion(center: coordinate, span: span)
                        mapView.setRegion(region, animated: true)
                    }
                }
            } catch {
                print("error")
            }
        }
    }
    
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            choosenLatitude = touchedCoordinates.latitude
            choosenLongitude = touchedCoordinates.longitude
            
            let annotion = MKPointAnnotation()
            annotion.coordinate = touchedCoordinates
            annotion.title = nameText.text
            annotion.subtitle = commentText.text
            self.mapView.addAnnotation(annotion)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedTitle == "" {
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "myAnnotion"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKMarkerAnnotationView
        
        if pinView == nil {
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .blue
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedTitle != "" {
            var requestLocation = CLLocation(latitude: annotionLatitude, longitude: annotionLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
                
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotionTitle
                        
                        let lauchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: lauchOptions)
                    }
                }
            }
        }
    }

    @IBAction func locationSaveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(choosenLatitude, forKey: "latitude")
        newPlace.setValue(choosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            nameText.text = ""
            commentText.text = ""
            print("success")
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlaces"), object: nil)
        navigationController?.popViewController(animated: true)
    }
}


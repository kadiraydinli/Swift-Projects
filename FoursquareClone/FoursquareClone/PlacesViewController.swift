//
//  PlacesViewController.swift
//  FoursquareClone
//
//  Created by Kadir Aydınlı on 20.12.2022.
//

import UIKit
import Parse

class PlacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var placeNameArray = [String]()
    var placeIDArray = [String]()
    var selectedPlaceID = ""

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButton))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromParse()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { places, error in
            if error != nil {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "Parse error")
            } else {
                if places != nil {
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIDArray.removeAll(keepingCapacity: false)
                    for place in places! {
                        if let name = place.object(forKey: "name") as? String {
                            if let id = place.objectId {
                                self.placeNameArray.append(name)
                                self.placeIDArray.append(id)
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenPlaceID = selectedPlaceID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceID = placeIDArray[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    @objc func logoutButton() {
        PFUser.logOutInBackground { error in
            if error != nil {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "Parse error")
            } else {
                self.performSegue(withIdentifier: "toHomeVC", sender: nil)
            }
        }
    }
    
    @objc func addButton() {
        self.performSegue(withIdentifier: "toAddOneVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    
}

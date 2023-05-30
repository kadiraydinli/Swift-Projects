//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Kadir Aydınlı on 22.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Android")
        landmarkNames.append("Apple")
        landmarkNames.append("Css 3")
        landmarkNames.append("JavaScript")
        landmarkNames.append("Java")
        landmarkNames.append("React")
        landmarkNames.append("Swift")
        landmarkNames.append("Typescript")
        
        landmarkImages.append(UIImage(named: "Android")!)
        landmarkImages.append(UIImage(named: "Apple")!)
        landmarkImages.append(UIImage(named: "Css 3")!)
        landmarkImages.append(UIImage(named: "JavaScript")!)
        landmarkImages.append(UIImage(named: "Java")!)
        landmarkImages.append(UIImage(named: "React")!)
        landmarkImages.append(UIImage(named: "Swift")!)
        landmarkImages.append(UIImage(named: "Typescript")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenLandmarkName = landmarkNames[indexPath.row]
        self.chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            // Alternative
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }

}


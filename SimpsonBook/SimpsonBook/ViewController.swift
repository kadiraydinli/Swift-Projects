//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Kadir Aydınlı on 26.11.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Simpson Objects
        let homer = Simpson(name: "Homer", job: "Nuclear Safety", image: UIImage(named: "homer")!)
        let apu = Simpson(name: "Apu", job: "unemployed", image: UIImage(named: "apu")!)
        let bart = Simpson(name: "Bart", job: "bart job", image: UIImage(named: "bart")!)
        let lisa = Simpson(name: "Lisa", job: "Ev hanımı", image: UIImage(named: "lisa")!)
        let maggie = Simpson(name: "Maggie", job: "Baby", image: UIImage(named: "maggie")!)
        let marge = Simpson(name: "Marge", job: "Marge Job", image: UIImage(named: "marge")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(apu)
        mySimpsons.append(apu)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        mySimpsons.append(marge)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson =  mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}


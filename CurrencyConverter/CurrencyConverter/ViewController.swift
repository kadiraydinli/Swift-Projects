//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Kadir Aydınlı on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadText: UILabel!
    @IBOutlet weak var tryText: UILabel!
    @IBOutlet weak var usdText: UILabel!
    @IBOutlet weak var jpyText: UILabel!
    @IBOutlet weak var gbpText: UILabel!
    @IBOutlet weak var chfText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func fetchButton(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                if data != nil {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResult["rates"] as? [String: Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadText.text = "CAD: \(cad)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfText.text = "CHF: \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpText.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyText.text = "JPY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdText.text = "USD: \(usd)"
                                }
                                
                                if let tl = rates["TRY"] as? Double {
                                    self.tryText.text = "TRY: \(tl)"
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        
        task.resume()
    }
}


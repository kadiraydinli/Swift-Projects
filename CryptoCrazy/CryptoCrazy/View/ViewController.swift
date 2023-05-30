//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Kadir Aydınlı on 3.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
    
    private var cryptoListViewModel: CryptoListViewModel!
    
    var colorArray = [UIColor]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 50/255, green: 150/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 110/255, green: 150/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 75/255, green: 100/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 80/255, green: 140/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 130/255, green: 150/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 140/255, green: 150/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 60/255, green: 10/255, blue: 170/255, alpha: 1.0)
        ]
        
        getData()
    }
    
    func getData() {
        let webservice = Webservice()
        webservice.downloadCurrencies(url: url) { cryptoList in
            if let cryptoList = cryptoList {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoList)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel != nil ? self.cryptoListViewModel.numberOfSection() : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.currencyText.text = cryptoViewModel.name
        cell.prizeText.text = cryptoViewModel.price
        cell.backgroundColor = colorArray[indexPath.row % colorArray.count]
        
        return cell
    }
}


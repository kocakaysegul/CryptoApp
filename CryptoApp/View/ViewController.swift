//
//  ViewController.swift
//  CryptoApp
//
//  Created by Ayşegül Koçak on 29.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self
        
        self.colorArray = [
        UIColor(red: 150/255, green: 45/255, blue: 170/255, alpha: 1),
        UIColor(red: 15/255, green: 77/255, blue: 170/255, alpha: 1),
        UIColor(red: 104/255, green: 34/255, blue: 16/255, alpha: 1),
        UIColor(red: 104/255, green: 159/255, blue: 98/255, alpha: 1),
        UIColor(red: 114/255, green: 150/255, blue: 200/255, alpha: 1),
        UIColor(red: 154/255, green: 200/255, blue: 169/255, alpha: 1),
        
        ]
        
        getData()
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { cryptos in
            
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptpCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell") as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }


}


//
//  Webservice.swift
//  CryptoApp
//
//  Created by Ayşegül Koçak on 1.04.2023.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url : URL, completion : @escaping ([CryptoCurrency]?) -> ()) {
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                print(cryptoList)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
            
        }.resume() // resume ile işlemi başlatıyoruz.
        
        
    }
    
}

//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Ayşegül Koçak on 1.04.2023.
//

import Foundation

struct CryptoListViewModel {
    
    let cryptpCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptpCurrencyList.count
    }
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel {
        
        let crypto = self.cryptpCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
    
}

extension CryptoListViewModel {
  /*
    func numberOfRowsInSection() -> Int {
          return self.cryptoCurrencyList.count
      }
      
      func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
          let crypto = self.cryptoCurrencyList[index]
          return CryptoViewModel(crypto)
      }
 */
    
}

struct CryptoViewModel {
    
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}


extension CryptoViewModel {
    /*
     init(_ crypto: CryptoCurrency) {
        self.crytpoCurrency = crypto
    }
     */
}

extension CryptoViewModel {
    /*
    var name: String {
          return self.crytpoCurrency.currency
      }
      
      var price: String {
          return self.crytpoCurrency.price
      }
 */
    
}

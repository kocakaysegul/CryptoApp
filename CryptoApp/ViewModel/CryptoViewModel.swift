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

struct CryptoViewModel {
    
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
}

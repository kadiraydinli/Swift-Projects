//
//  CryptoViewModel.swift
//  CryptoCrazy
//
//  Created by Kadir Aydınlı on 3.01.2023.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = cryptoCurrencyList[index]
        return CryptoViewModel(crypoCurrency: crypto)
    }
}

extension String {
    func printMyName() {
        print("hello world")
    }
}

struct CryptoViewModel {
    let crypoCurrency: CryptoCurrency
    
    var name: String {
        return self.crypoCurrency.currency
    }
    
    var price: String {
        return self.crypoCurrency.price
    }
}

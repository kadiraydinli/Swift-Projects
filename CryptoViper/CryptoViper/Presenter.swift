//
//  Presenter.swift
//  CryptoViper
//
//  Created by Kadir Aydınlı on 4.01.2023.
//

import Foundation

enum NetworkError {
    case NetworkFailed
    case ParsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let crypto):
            // gfh
        case .failure(let crypto):
            //fdgdfs
        }
    }
    
    
}

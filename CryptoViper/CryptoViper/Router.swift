//
//  Router.swift
//  CryptoViper
//
//  Created by Kadir Aydınlı on 4.01.2023.
//

import Foundation

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        return router
    }
}

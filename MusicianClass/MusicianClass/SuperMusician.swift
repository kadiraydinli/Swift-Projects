//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Kadir Aydınlı on 26.11.2022.
//

import Foundation

class SuperMusician: Musicians {
    func sign2() {
        print("signing2...")
    }
    
    override func sing() {
        super.sing()
        print("override sing")
    }
}

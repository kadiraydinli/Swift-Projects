//
//  Musicians.swift
//  MusicianClass
//
//  Created by Kadir Aydınlı on 22.11.2022.
//

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("singing...")
    }
}

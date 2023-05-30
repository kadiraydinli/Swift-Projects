//
//  MusicianStruct.swift
//  AdvancedSwiftProject
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import Foundation

struct MusicianStruct {
    var name: String
    var age: Int
    var intrument: String
    
    mutating func happyBirthday() {
        self.age += 1
    }
}

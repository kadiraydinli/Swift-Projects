//
//  MusicianClass.swift
//  AdvancedSwiftProject
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import Foundation

class MusicianClass {
    var name: String
    var age: Int
    var intrument: String
    
    init(name: String, age: Int, intrument: String) {
        self.name = name
        self.age = age
        self.intrument = intrument
    }
    
    func happyBirthday() {
        self.age += 1
    }
}

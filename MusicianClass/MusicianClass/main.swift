//
//  main.swift
//  MusicianClass
//
//  Created by Kadir Aydınlı on 22.11.2022.
//

import Foundation

let james = Musicians(nameInit: "Kadir", ageInit: 24, instrumentInit: "Guitar", typeInit: .Vocalist)

print(james.age)
print(james.type)

let kirk = SuperMusician(nameInit: "İlhan", ageInit: 27, instrumentInit: "Guitar", typeInit: .Bassist)

kirk.sing()

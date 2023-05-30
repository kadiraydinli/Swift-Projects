//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import Foundation

let classKadir = MusicianClass(name: "Kadir", age: 25, intrument: "Piano")

// print(classKadir.age)

var structKadir = MusicianStruct(name: "Kadir", age: 25, intrument: "Guitar")

// IMMUTABLE STRUCT

// print(structKadir.age)

classKadir.age = 24

// print(classKadir.age)

structKadir.age = 24

// print(structKadir.age)

// REFERENCE VS VALUE

let copyOfClassKadir = classKadir

var copyOfStructKadir = structKadir


// print(copyOfClassKadir.age)
// print(copyOfStructKadir.age)

copyOfClassKadir.age = 52
copyOfStructKadir.age = 52

// print(copyOfClassKadir.age)
// print(copyOfStructKadir.age)

// print(classKadir.age)
// print(structKadir.age)

// Function vs Mutating Function

// print(classKadir.age)
classKadir.happyBirthday()
// print(classKadir.age)

// print(structKadir.age)
structKadir.happyBirthday()
// print(structKadir.age)


// Tuple

let myTuple = (1, 3, 5)
// print(myTuple.2)

var myTuple2 = (1, 3, 5, 7)
myTuple2.2 = 10
// print(myTuple2.2)

let myTuple3 = ("Kadir", 25)
// print(myTuple3.0)

let myTuple4 = (0, [10, 20, 30])
// print(myTuple4.1[1])

let predefinedTuple: (String, String)
predefinedTuple.0 = "Kadir"
predefinedTuple.1 = "Aydınlı"

let newTuple = (name: "Kadir", surname: "Aydınlı")
// print(newTuple.name)

// Guard Let vs If Let

// Guard -> Negative
// If -> Positive

let myString = "5"

func convertToIntegerGuard(stringInput: String) -> Int {
    guard let myInteger = Int(stringInput) else { return 0 }
    return myInteger
}

func convertToIntegerIf(stringInput: String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    }
    return 0
}

// print(convertToIntegerIf(stringInput: myString))
// print(convertToIntegerGuard(stringInput: myString))

// Breakpoint
var x = 5

print(x)

x += 1

print(x)

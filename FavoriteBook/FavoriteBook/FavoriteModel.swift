//
//  FavoriteModel.swift
//  FavoriteBook
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import Foundation

struct FavoriteModel: Identifiable {
    var id = UUID()
    var title: String
    var elements: [FavoriteElement]
}

struct FavoriteElement: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
}

// Characters
let mario = FavoriteElement(name: "Mario", image: "mario", description: "Game Character")
let mario2 = FavoriteElement(name: "Mario2", image: "mario", description: "Game Character2")
let mario3 = FavoriteElement(name: "Mario3", image: "mario", description: "Game Character3")

let favoriteCharacter = FavoriteModel(title: "Characters", elements: [mario, mario2, mario3])

// Programming Language
let swift = FavoriteElement(name: "Swift", image: "swift", description: "Apple Language")
let ts = FavoriteElement(name: "Typescript", image: "typescript", description: "Javascript language")
let css = FavoriteElement(name: "CSS", image: "css-3", description: "CSS style language")
let apple = FavoriteElement(name: "Apple", image: "apple", description: "Apple Inc.")
let js = FavoriteElement(name: "JavaScript", image: "js", description: "JavaScript is a confusing language")
let java = FavoriteElement(name: "Java", image: "java", description: "Java is a hard language")
let react = FavoriteElement(name: "React", image: "react", description: "React is a library of JavaScripy")

let favoriteLanguages = FavoriteModel(title: "Programming Language", elements: [swift, ts, css, apple, js, java, react])

let myFavorite = [favoriteCharacter, favoriteLanguages]

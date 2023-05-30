//
//  ContentView.swift
//  FavoriteBook
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach (myFavorite) { favorite in
                    Section(header: Text(favorite.title)) {
                        ForEach (favorite.elements) { element in
                            NavigationLink(destination: DetailView(chosenFavoriteElement: element)) {
                                HStack {
                                    Image(element.image).resizable().frame(width: 30, height: 30)
                                    Text(element.name)
                                }
                            }
                        }
                    }
                }
            }.navigationTitle(Text("Favorite Book"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

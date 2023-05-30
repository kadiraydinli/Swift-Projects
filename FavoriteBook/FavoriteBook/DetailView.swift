//
//  DetailView.swift
//  FavoriteBook
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct DetailView: View {
    
    var chosenFavoriteElement: FavoriteElement
    
    var body: some View {
        VStack {
            Image(chosenFavoriteElement.image)
                .resizable()
                .frame(width: 300, height: 300).padding()
            Text(chosenFavoriteElement.name)
                .font(.system(size: 60))
                .padding()
            Text(chosenFavoriteElement.description).font(.system(size: 40))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(chosenFavoriteElement: mario)
    }
}

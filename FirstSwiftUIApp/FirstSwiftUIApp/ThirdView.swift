//
//  ThirdView.swift
//  FirstSwiftUIApp
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct ThirdView: View {
    
    let seasons = ["Spring", "Summer", "Auntumn", "Winter"]
    
    var body: some View {
        /*List (seasons, id: \.self) { element in
            HStack {
                Image("mario").resizable().frame(width: 30, height: 30)
                Text(element)
            }
        }*/
        List {
            ForEach(seasons, id: \.self) { element in
                Text(element)
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

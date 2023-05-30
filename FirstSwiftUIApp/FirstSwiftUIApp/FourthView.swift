//
//  FourthView.swift
//  FirstSwiftUIApp
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct FourthView: View {
    
    @State var myName = "Kadir"
    
    var body: some View {
        VStack {
            Text(myName)
                .font(.largeTitle)
                .padding()
            Button(action: {
                myName = "İlhan"
            }) {
                Text("Click")
                    .font(.largeTitle)
            }
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}

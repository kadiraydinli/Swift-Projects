//
//  FifthView.swift
//  FirstSwiftUIApp
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "Kadir"
    
    var body: some View {
        VStack {
            Text(myName)
            TextField("placeholder", text: $myName)
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}

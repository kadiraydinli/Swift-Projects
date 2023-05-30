//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor).padding(10.0)
            Text("Hello, world!").font(.body).fontWeight(.heavy).multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

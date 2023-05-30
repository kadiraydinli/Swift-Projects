//
//  SecondView.swift
//  FirstSwiftUIApp
//
//  Created by Kadir Aydınlı on 27.12.2022.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Image("mario").resizable().aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

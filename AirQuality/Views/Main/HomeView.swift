//
//  HomeView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("Home")
                .navigationTitle("Home")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

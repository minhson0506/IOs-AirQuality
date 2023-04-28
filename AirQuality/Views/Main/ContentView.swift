//
//  ContentView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            PermissionView()
                .environmentObject(LocationViewModel())
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

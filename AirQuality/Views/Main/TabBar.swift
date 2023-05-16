//
//  TabBar.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI


// View for TabView contains navigation bar for tha app

struct TabBar: View {
    @State private var tabSelection = 1

    @State var devices: [AllDevices.Device]
    @Binding var device: AllDevices.Device?
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView(devices: devices,selectedDevice: $device)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(1)
            
            ChartView(selectedDevice: $device)
                .tabItem {
                    Label("Chart", systemImage: "chart.bar.fill")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .navigationBarBackButtonHidden(true)
    }
}


//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}

//
//  AirQualityApp.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

@main
struct AirQualityApp: App {
    @StateObject var allDevicesVM = AllDevicesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(allDevicesVM)
        }
    }
}

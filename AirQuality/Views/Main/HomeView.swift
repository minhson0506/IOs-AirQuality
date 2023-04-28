//
//  HomeView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct HomeView: View {
    var devices: [AllDevices.Device]
    @State private var selectedDevice: AllDevices.Device?
    @ObservedObject var latestSensorDataVM : LatestSensorDataViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                if !latestSensorDataVM.sensorData.isEmpty {
                    LatestSensorDataGridView(latestSensorData: latestSensorDataVM.sensorData)
                        .padding()
                } else {
                    Text("Loading...")
                        .padding()
                }
                
                Divider()
                
                if devices.isEmpty {
                    Text("Loading...")
                } else {
                    Menu {
                        ForEach(devices, id: \.self) { device in
                            Button(device.deviceName) {
                                selectedDevice = device
                                latestSensorDataVM.fetchLatestSensorData(for: device.deviceName)
                            }
                        }
                    } label: {
                        Label(selectedDevice?.deviceName ?? "Select Device", systemImage: "rectangle.expand.vertical")
                            .foregroundColor(.primary)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.secondary.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Home")
        }
    }
}



//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .environmentObject(AllDevicesViewModel())
//    }
//}

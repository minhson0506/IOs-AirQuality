//
//  HomeView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI


// MARK: Display all relevant data from device
struct HomeView: View {
    var devices: [AllDevices.Device]
    @StateObject var deviceVM = AllDevicesViewModel() // Create an instance of AllDevicesViewModel
    @Binding var selectedDevice: AllDevices.Device?
    @ObservedObject var latestSensorDataVM = LatestSensorDataViewModel()

    var body: some View {
        VStack(alignment: .center){
            DeviceOption(deviceVM: deviceVM, selectedDevice: $selectedDevice, latestSensorDataVM: latestSensorDataVM)

            LatestSensorDataGridView(latestSensorData: latestSensorDataVM.sensorData)
                .padding(.top, -30)
                .padding(.bottom, 10)
                .onReceive(latestSensorDataVM.$sensorData) { sensorData in
                    if sensorData.isEmpty {
                        latestSensorDataVM.fetchLatestSensorData(for: selectedDevice?.deviceName ?? "")
                    }
                }
                
        }
        .onAppear(perform: {
            latestSensorDataVM.fetchLatestSensorData(for: selectedDevice?.deviceName ?? "")
        })
        .onChange(of: selectedDevice) { newValue in
            latestSensorDataVM.fetchLatestSensorData(for: newValue?.deviceName ?? "")
        }
    }
}



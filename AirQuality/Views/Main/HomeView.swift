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
    @Binding var selectedDevice: AllDevices.Device?
    @ObservedObject var latestSensorDataVM = LatestSensorDataViewModel()

    var body: some View {
        VStack(alignment: .center){
            HStack {
                // Menu to choose the device
                Menu {
                    ForEach(devices, id: \.self) { device in
                        Button(device.deviceName) {
                            selectedDevice = device
                            latestSensorDataVM.fetchLatestSensorData(for: device.deviceName)
                        }
                    }
                } label: {
                    Label(selectedDevice?.deviceName ?? "Select device", systemImage: "rectangle.expand.vertical")
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.secondary.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
            }

            LatestSensorDataGridView(latestSensorData: latestSensorDataVM.sensorData)
                .padding()
                .onReceive(latestSensorDataVM.$sensorData) { sensorData in
                    if sensorData.isEmpty {
                        latestSensorDataVM.fetchLatestSensorData(for: selectedDevice?.deviceName ?? "")
                    }
                }

            Spacer()
        }
        .onAppear(perform: {
            latestSensorDataVM.fetchLatestSensorData(for: selectedDevice?.deviceName ?? "")
        })
        .onChange(of: selectedDevice) { newValue in
            latestSensorDataVM.fetchLatestSensorData(for: newValue?.deviceName ?? "")
        }
    }
}



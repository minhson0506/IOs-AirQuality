//
//  DeviceOption.swift
//  AirQuality
//
//  Created by Chi Nguyen on 1.6.2023.
//

import SwiftUI

struct DeviceOption: View {
    @ObservedObject var deviceVM: AllDevicesViewModel
    @Binding var selectedDevice: AllDevices.Device?
    @ObservedObject var latestSensorDataVM: LatestSensorDataViewModel

    var body: some View {
        if deviceVM.allDevices.isEmpty {
            Text("Loading...")
        } else {
            Menu {
                ForEach(deviceVM.allDevices, id: \.self) { device in
                    Button(device.deviceName) {
                        selectedDevice = device
                        latestSensorDataVM.fetchLatestSensorData(for: device.deviceName)
                        // Convert the sensor data to SensorDataDisplay
//                        print("Data to display: \(sensorDataDisplays))")
                    }
                    .foregroundColor(.white)
                }
            } label: {
                Label(selectedDevice?.deviceName ?? "Select Device", systemImage: "rectangle.expand.vertical")
                    .foregroundColor(Color("Blue"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("LightBlue"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
        }
    }
}


//
//  DeviceOptionView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import SwiftUI

// MARK: View for user to choose which device they want to access the data
struct DeviceOptionView: View {
    @ObservedObject var deviceVM = AllDevicesViewModel()
//    var devices: [AllDevices.Device]
    @State private var selectedDevice: AllDevices.Device?
    @ObservedObject var latestSensorDataVM  = LatestSensorDataViewModel()
    @State private var sensorDataDisplays: [SensorDataDisplay] = []
    
    var body: some View {
        
        VStack {
            Image("Icon")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 100)
            
            Image("landing")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Spacer()
            
            if deviceVM.allDevices.isEmpty {
                Text("Loading...")
            } else {
                Menu {
                    ForEach(deviceVM.allDevices, id: \.self) { device in
        
                        Button(device.deviceName) {
                            selectedDevice = device
                            latestSensorDataVM.fetchLatestSensorData(for: device.deviceName)
                                 // Convert the sensor data to SensorDataDisplay
                            print("Data to display: \(sensorDataDisplays))")
                        
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
                
                Spacer()
                
                // Use NavigationLink to present HomeView when a device is selected

                NavigationLink(
                    destination: TabBar(devices: deviceVM.allDevices, device: $selectedDevice),
                    isActive: Binding<Bool>(
                        get: { selectedDevice != nil },
                        set: { if !$0 { selectedDevice = nil } }
                    ),
                    label: { EmptyView() }
                )
                
            }

        }
        .navigationTitle("Select Device")
        .navigationBarHidden(true)
    }
}


//
//  DeviceOptionView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import SwiftUI

struct DeviceOptionView: View {
    var devices: [AllDevices.Device]
    
    var body: some View {
        
        VStack {
            Image("landing")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            ForEach(devices, id: \.self) { device in
                Text(device.deviceName)
            }
//            Picker (selection: $selectedDevice, label: Text("Device name")) {
//                ForEach(devices, id: \.self) { device in
//                    Text(device.deviceName).tag(device.deviceId)
//                }
//            }
            
            //                    Picker(selection: $selectedDevice, label: Text("Select a device")) {
            //                        ForEach(devices, id: \.id) { device in
            //                            Text(device.name)
            //                        }
            //                    }
            //
            //                    if let device = selectedDevice {
            //                        // Display device control view for selected device
            //                        TabBar(selectedDevice: device)
            //                    } else {
            //                        // Display placeholder view
            //                        Text("Please select a device")
            //                    }
            //                }
        }
    }
}




//struct DeviceOptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceOptionView()
//    }
//}

//
//  LatestSensorDataGridView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import SwiftUI

//MARK: Display all important sensor data from device
struct LatestSensorDataGridView: View {
    var latestSensorData: [LatestSensorData.SensorData]
    var displayData: [SensorDataDisplay] {
        guard let latestData = latestSensorData.last else {
            return []
        }
        return convertSensorDataToDisplay(sensorData: latestData)
    }
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(displayData, id: \.name) { data in
                    SensorDataComponentView(displayData: data)
                }
            }
            .padding()
        }
        .onAppear(perform: {
            print(displayData)
        })
    }
        
}


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
    @State private var showExtraInfo = false
    @State private var displayInfo: String = ""

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(displayData, id: \.name) { data in
                    VStack(spacing: 8) {
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.green)
                                    .frame(width: 30, height: 30)
                                
                                Image(systemName: "\(data.image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                            }
                            .background(Color.clear)
                            
                            Text(data.name)
                                .font(.headline)
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    showExtraInfo(with: data.name)
                                }
                        }
                        
                        Text(data.value)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(data.unit)
                            .font(.footnote)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                }
            }
        }
        .sheet(isPresented: $showExtraInfo) {
            ExtraInfoView(extraInfo: $displayInfo)
               
        }
    }
    
    func showExtraInfo(with name: String) {
        switch name {
        case "PM10":
            displayInfo = "Particle density of particulate Matter(PM) in size range 0.3µm to 10.0µm in µg/m3"
        case "PM2.5":
            displayInfo = "Particle density of particulate Matter(PM) in size range 0.3µm to 2.5µm in µg/m3"
        case "PM1":
            displayInfo = "Particle density of particulate Matter(PM) in size range 0.3µm to 1.0µm in µg/m3"
        case "PM4":
            displayInfo = "Particle density of particulate Matter(PM) in size range 0.3µm to 4.0µm in µg/m3"
        case "Light":
            displayInfo = "Lighting in lux"
        case "Noise":
            displayInfo = "Loudness in dB"
        case "CO2":
            displayInfo = "Carbon dioxide in ppm"
        case "Humidity":
            displayInfo = "Humidity in %RH"
        case "Pressure":
            displayInfo = "Pressure in hPa"
        case "Temperature":
            displayInfo = "Temperature in °C"
        default:
            displayInfo = ""
        }
        showExtraInfo = true
    }
}



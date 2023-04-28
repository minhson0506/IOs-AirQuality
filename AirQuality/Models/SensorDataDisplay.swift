//
//  SensorDataDisplay.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import Foundation
import SwiftUI

struct SensorDataDisplay {
    let id: UUID
    var image: String
    var name: String
    var value: String
    var unit: String
    var desc: String
}

func convertSensorDataToDisplay(sensorData: LatestSensorData.SensorData) -> [SensorDataDisplay] {
    var displayData: [SensorDataDisplay] = []
    let mirror = Mirror(reflecting: sensorData)
            
    for case let (label?, value) in mirror.children {
                let id = UUID()
                var image = ""
                var name = ""
                var unit = ""
                var desc = ""
        
        switch label {
        case "temp":
            name = "Temperature"
            image = "thermometer.medium"
            unit = "°C"
            desc = "Temperature in °C"
        case "hum":
            name = "Humidity"
            image = "drop.fill"
            unit = "RH"
            desc = "Humidity in %RH"
        case "pres":
            name = "Pressure"
            image = "rectangle.compress.vertical"
            unit = "hPa"
            desc = "Pressure in hPa"
        case "co2":
            name = "CO2"
            image = "carbon.dioxide.cloud"
            unit = "ppm"
            desc = "Carbon dioxide in ppm"
        case "lux":
            name = "Light"
            image = "sun.and.horizon"
            unit = "lux"
            desc = "Lighting in lux"
        case "pm2_5":
            name = "PM2.5"
            image = "wind"
            unit = "µg/m³"
            desc = "Particle density of particulate Matter(PM) in size range 0.3µm to 2.5µm in µg/m3"
        case "pm10":
            name = "PM10"
            image = "wind"
            unit = "µg/m³"
            desc = "Particle density of particulate Matter(PM) in size range 0.3µm to 10.0µm in µg/m3"
        case "noise":
            name = "Noise"
            image = "speaker.wave.2"
            unit = "dB"
            desc = "Loudness in dB"
        case "pm1":
            desc = "Particle density of particulate Matter(PM) in size range 0.3µm to 1.0µm in µg/m3"
            name = "PM1"
            image = "wind"
            unit = "µg/m³"
        case "pm4":
            desc = "Particle density of particulate Matter(PM) in size range 0.3µm to 4.0µm in µg/m3"
            name = "PM4"
            image = "wind"
            unit = "µg/m³"
        default:
            continue
        }
        
        let display = SensorDataDisplay(
            id: id,
            image: image,
            name: name,
            value: String(describing: value),
            unit: unit,
            desc: desc
        )
        displayData.append(display)
    }
    return displayData
}
    

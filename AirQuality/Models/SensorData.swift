//
//  SensorData.swift
//  AirQuality
//
//  Created by Chi Nguyen on 16.5.2023.
//

import Foundation

struct SensorData: Decodable {
    let alt: Double?
    let co2: Double?
    let hum: Double?
    let lux: Double?
    let noise: Double?
    let pm1: Double?
    let pm10: Double?
    let pm2_5: Double?
    let pm4: Double?
    let pres: Double?
    let temp: Double?
    let time: String?
}

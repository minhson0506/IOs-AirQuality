//
//  SensorDataInDate.swift
//  AirQuality
//
//  Created by Chi Nguyen on 16.5.2023.
//

import Foundation

typealias SensorDataInDateResult = SensorDataInDateQuery.Data

struct SensorDataInDate: Decodable {
    var sensorDataInDate: [SensorData]
    
    init(_ sensorDataInDate: SensorDataInDateResult?){
        self.sensorDataInDate = sensorDataInDate?.sensorDataInDate?.compactMap {
            guard let sensorDatum = $0 else { return nil }
            return SensorData(alt: sensorDatum.alt, co2: sensorDatum.co2, hum: sensorDatum.hum, lux: sensorDatum.lux, noise: sensorDatum.noise, pm1: sensorDatum.pm1, pm10: sensorDatum.pm10, pm2_5: sensorDatum.pm2_5, pm4: sensorDatum.pm4, pres: sensorDatum.pres, temp: sensorDatum.temp, time: sensorDatum.time)
        } ?? []
    }
}

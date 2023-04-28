//
//  LatestSensorDataModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import Foundation
import Apollo

typealias LatestSensorDataResult = LatestSensorDataQuery.Data

struct LatestSensorData: Decodable {
    var latestSensorData: [SensorData]
        
        struct SensorData : Decodable, Identifiable {
            var alt: Double
            var co2: Double
            var hum: Double
            var id: String
            var lux: Double
            var noise: Double
            var pm1: Double
            var pm10: Double
            var pm2_5: Double
            var pres: Double
            var pm4: Double
            var temp: Double
            var time: String
            
            init? (_ sensorData: LatestSensorDataResult.LatestSensorDatum?){
                guard let sensorData = sensorData else { return nil}
                self.alt = sensorData.alt
                self.co2 = sensorData.co2
                self.hum = sensorData.hum
                self.id = sensorData.id
                self.lux = sensorData.lux
                self.noise = sensorData.noise
                self.pm1 = sensorData.pm1
                self.pm10 = sensorData.pm10
                self.pm2_5 = sensorData.pm2_5
                self.pres  = sensorData.pres
                self.pm4 = sensorData.pm4
                self.temp = sensorData.temp
                self.time = sensorData.time
            }
        }
    
    init(_ latestSensorData: LatestSensorDataResult?) {
            self.latestSensorData = latestSensorData?.latestSensorData?.compactMap { SensorData($0) } ?? []
        }
    }
    
    




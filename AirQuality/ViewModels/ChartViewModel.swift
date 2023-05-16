//
//  ChartViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 10.5.2023.
//

import Foundation
import Apollo


class ChartViewModel: ObservableObject {
    @Published var sensorData: [SensorData] = []
    @Published var selectedValues: [String] = [] // Values selected for display

    func fetchSensorData(for deviceName: String, date: String) {
        Network.shared.apollo.fetch(query: SensorDataInDateQuery(deviceName: deviceName, date: date)) { (result: Result<GraphQLResult<SensorDataInDateQuery.Data>, Error>) in
            switch result {
            case .success(let graphQLResult):
                if let sensorDataInDate = graphQLResult.data?.sensorDataInDate {
                    print("DEBUG - Sensor Data for date \(date) fetch - Success! Result : \(graphQLResult)")
//                    self.sensorData = sensorDataInDate.compactMap(SensorDataInDate.init)
                    var parseData: [SensorData] = []
                    for data in sensorDataInDate {
                            // create sensor data
                        let dataItem = SensorData(alt: data?.alt, co2: data?.co2, hum: data?.hum, lux: data?.lux, noise: data?.noise, pm1: data?.pm1, pm10: data?.pm10, pm2_5: data?.pm2_5, pm4: data?.pm4, pres: data?.pres, temp: data?.temp, time: data?.time)
                        parseData.append(dataItem)
                    }
                    self.sensorData = parseData
                } else if let errors = graphQLResult.errors {
                    print("DEBUG - Sensor Data for date \(date) fetch - GraphQL errors: \(errors)")
                }
            case .failure(let error):
                print("DEBUG - Sensor Data for date \(date) fetch - Failed to fetch sensor data: \(error)")
            }
        }
    }

    var selectValueData: [Double] {
        sensorData.compactMap { sensorData in
            let selectedValue = selectedValues.first ?? "Select a value"
            
            switch selectedValue {
            case "alt":
                return sensorData.alt
            case "co2":
                return sensorData.co2
            case "hum":
                return sensorData.hum
            case "lux":
                return sensorData.lux
            case "noise":
                return sensorData.noise
            case "pm1":
                return sensorData.pm1
            case "pm10":
                return sensorData.pm10
            case "pm4":
                return sensorData.pm4
            case "pres":
                return sensorData.pres
            case "temp":
                return sensorData.temp
            case "pm2_5":
                return sensorData.pm2_5
            default:
                return nil
            }
        }
    }

}





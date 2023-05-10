//
//  ChartViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 10.5.2023.
//

import Foundation
import Apollo

class ChartViewModel: ObservableObject {
    
//    @Published var sensorData: [LatestSensorData.SensorData] = []
//    
//    func fetchSensorDataOnDate(deviceName: String, date: String) {
//        let query = SensorDataInDateQuery(deviceName: deviceName, date: date)
//        Network.shared.apollo.fetch(query: query){ [weak self] result in
//                    switch result {
//                    case .success(let graphQLResult):
//                        if let sensorData = graphQLResult.data?.sensorDataInDate {
//                            DispatchQueue.main.async {
//                                self?.sensorData = sensorData.map { LatestSensorData.SensorData(from: $0) }
//                            }
//                        }
//                    case .failure(let error):
//                        print("DEBUG - Error fetching sensor data: \(error.localizedDescription)")
//                    }
//                }
//    }
    
}

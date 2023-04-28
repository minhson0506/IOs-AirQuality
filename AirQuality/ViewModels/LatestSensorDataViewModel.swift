//
//  LatestSensorDataViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import Foundation
import Apollo

// MARK: ViewModel to fetch latest sensor data of a particular device based on device name
class LatestSensorDataViewModel: ObservableObject {
    @Published var sensorData: [LatestSensorData.SensorData] = []
    
    
    func fetchLatestSensorData(for deviceName: String) {
        Network.shared.apollo.fetch(query: LatestSensorDataQuery(deviceName: deviceName)) { result in
            switch result {
            case .success(let graphQLResult):
                
                if let latestSensorData = graphQLResult.data?.latestSensorData{
                    print("DEBUG - LatestSensorData fetch - Success! Result : \(graphQLResult)")
                    self.sensorData = latestSensorData.compactMap(LatestSensorData.SensorData.init)
                } else if let errors = graphQLResult.errors {
                    print("DEBUG - LatestSensorData fetch - GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("DEBUG - LatestSensorData fetch - Failure! Error : \(error)")
            }
        }
    }
    
}




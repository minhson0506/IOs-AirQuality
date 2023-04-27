//
//  AllDevicesViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation

class AllDevicesViewModel: ObservableObject {
    
    
    init(){
        fetchAllDevices()
    }
    
    func fetchAllDevices() {
        Network.shared.apollo.fetch(query: AllDevicesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                print("DEBUG - AllDevice fetch - Success! Result : \(graphQLResult)")
            case .failure(let error):
                print("DEBUG - AllDevice fetch - Failure! Error : \(error)")
            }
        }
    }
}


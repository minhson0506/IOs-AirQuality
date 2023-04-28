//
//  AllDevicesViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation


//MARK: ViewModel to handle the fetch all devices from api
class AllDevicesViewModel: ObservableObject {
    @Published var allDevices: [AllDevices.Device] = []
    
    init(){
        fetchAllDevices()
    }
    
    func fetchAllDevices() {
        Network.shared.apollo.fetch(query: AllDevicesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                
                if let allDevices = graphQLResult.data?.allDevices{
                    print("DEBUG - AllDevice fetch - Success! Result : \(graphQLResult)")
                    self.allDevices = allDevices.compactMap(AllDevices.Device.init)
                } else if let errors = graphQLResult.errors {
                    print("DEBUG - AllDevice fetch - GraphQL errors \(errors)")
                }
                
            case .failure(let error):
                print("DEBUG - AllDevice fetch - Failure! Error : \(error)")
            }
        }
    }
    
}


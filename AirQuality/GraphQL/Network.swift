//
//  Network.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    let url = "https://airqualitybackend.onrender.com/graphql"
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
    
}

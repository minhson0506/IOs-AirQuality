//
//  DeviceModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation

//typealias AllDevicesData = AllDevicesQuery.Data
//
//struct AllDevices: Decodable {
//    var allDevices: [Device]
//
//    init(_ allDevices: AllDevicesData?) {
//        self.allDevices = allDevices.self ?? []
//    }
//
//    struct Device : Decodable {
//        var deviceId: String
//        var deviceName: String
//
//        init(data: AllDevicesData.AllDevice) {
//            self.deviceId = data.deviceId
//            self.deviceName = data.deviceName
//        }
//    }
//}

typealias AllDevicesData = AllDevicesQuery.Data

struct AllDevices: Decodable {
    var allDevices: [Device]
    
    init(_ allDevices: AllDevicesData?) {
        self.allDevices = allDevices?.allDevices?.compactMap(Device.init) ?? []
    }
    
    struct Device : Decodable {
        var deviceId: String
        var deviceName: String
        
        init?(_ data: AllDevicesData.AllDevice?) {
            guard let data = data else { return nil }
            self.deviceId = data.deviceId
            self.deviceName = data.deviceName
        }
    }
}


//
//  DeviceModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation

typealias AllDevicesData = AllDevicesQuery.Data

struct AllDevices: Decodable {
    var allDevices: [Device]
    
    init(_ allDevices: AllDevicesData?) {
        self.allDevices = allDevices?.allDevices?.compactMap(Device.init) ?? []
    }
    
    struct Device : Decodable, Hashable {
        var deviceId: String
        var deviceName: String
        
        init?(_ data: AllDevicesData.AllDevice?) {
            guard let data = data else { return nil }
            self.deviceId = data.deviceId
            self.deviceName = data.deviceName
        }
        
        static func == (lhs: Device, rhs: Device) -> Bool {
                return lhs.deviceId == rhs.deviceId
            }
            
            func hash(into hasher: inout Hasher) {
                hasher.combine(deviceId)
            }
    }
}



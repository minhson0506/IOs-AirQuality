//
//  LatestSensorDataGridView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import SwiftUI

struct LatestSensorDataGridView: View {
    var latestSensorData: [LatestSensorData.SensorData]

    var body: some View {
        Text("\(latestSensorData[0].time)")
    }
}

//struct LatestSensorDataGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        LatestSensorDataGridView()
//    }
//}

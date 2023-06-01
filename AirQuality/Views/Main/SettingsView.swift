//
//  SettingsView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//


import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                RangeSliderView(name: "PM10", initialMinValue: 0.0, initialMaxValue: 10)
                RangeSliderView(name: "PM4",initialMinValue: 0.0, initialMaxValue: 10)
                RangeSliderView(name: "PM1",initialMinValue: 0.0, initialMaxValue: 10)
                RangeSliderView(name: "PM2.5",initialMinValue: 0.0, initialMaxValue: 10)
                RangeSliderView(name: "Noise",initialMinValue: -100, initialMaxValue: 100)
                RangeSliderView(name: "CO2",initialMinValue: 0.0, initialMaxValue: 1000.0)
                RangeSliderView(name: "Pressure",initialMinValue: 0.0, initialMaxValue: 100)
                RangeSliderView(name: "Temperature",initialMinValue: 0.0, initialMaxValue: 100)
                RangeSliderView(name: "Light",initialMinValue: 0.0, initialMaxValue: 100)
            }
        }
        .padding()
    }
    
}

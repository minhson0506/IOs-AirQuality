//
//  SettingsView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//


import SwiftUI

struct SettingsView: View {
    @StateObject private var pm10Slider = CustomSlider(start: 0, end: 54, name: "PM10" )
    @StateObject private var pm1Slider = CustomSlider(start: 0, end: 54, name: "PM1" )
    @StateObject private var pm4Slider = CustomSlider(start: 0, end: 54, name: "PM4" )
    @StateObject private var pm25Slider = CustomSlider(start: 0, end: 12, name: "PM2.5" )
    @StateObject private var noiseSlider = CustomSlider(start: 0, end: 35, name: "Noise" )
    @StateObject private var lightSlider = CustomSlider(start: 0, end: 300, name: "Light" )
    @StateObject private var tempSlider = CustomSlider(start: 0, end: 30, name: "Temperature" )
    @StateObject private var presSlider = CustomSlider(start: 0, end: 1050, name: "Pressure" )
    @StateObject private var co2Slider = CustomSlider(start: 0, end: 5000, name: "C02" )
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Settings")
                    .font(.title2)
                    .padding(.bottom, 20)
                SliderView(slider: pm10Slider, name: "PM10")
                    .padding(.bottom, 20)
                SliderView(slider: pm1Slider, name: "PM1")
                    .padding(.bottom, 20)
                SliderView(slider: pm4Slider, name: "PM4")
                    .padding(.bottom, 20)
                SliderView(slider: pm25Slider, name: "PM2.5")
                    .padding(.bottom, 20)
                SliderView(slider: noiseSlider, name: "Noise")
                    .padding(.bottom, 20)
                SliderView(slider: lightSlider, name: "Light")
                    .padding(.bottom, 20)
                SliderView(slider: tempSlider, name: "Temperature")
                    .padding(.bottom, 20)
                SliderView(slider: presSlider, name: "Pressure")
                    .padding(.bottom, 20)
                SliderView(slider: co2Slider, name: "CO2")
                    .padding(.bottom, 20)
            }
        }
        .padding()
    }
        
}
    


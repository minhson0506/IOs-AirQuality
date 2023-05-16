//
//  ChartView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    @State private var selectedDate: Date = Date()
    @Binding var selectedDevice: AllDevices.Device?
    @EnvironmentObject var chartViewModel: ChartViewModel
    private let valueOptions: [String] = ["alt", "co2", "hum", "lux", "noise", "pm1", "pm10", "pm4", "pres", "temp", "pm2_5"]
 

    var body: some View {
        VStack {
                CalendarView(selectedDate: $selectedDate)
                Text("Selected Date: \(formattedSelectedDate)")
                
                Menu(content: {
                    ForEach(valueOptions, id: \.self) { value in
                    Button(action: {
                        updateSelectedValue(value)
                    }) {
                        Text(value)
                        }
                    }
                }, label: {
                    Text(selectedValueDisplay())
                    })
                    .padding(.horizontal)
            
            Spacer()

                if !chartViewModel.sensorData.isEmpty {
                    LineChartView(data: chartViewModel.selectValueData, title: selectedValueDisplay())
                        .frame(height: 300)
                } else {
                    Text("No data on date")
                }
                
                
            }
            .onAppear {
                fetchSensorData()
            }
            .onChange(of: selectedDate) { _ in
                fetchSensorData()
            }

    }
    
    
    
    private func selectedValueDisplay() -> String {
            if let selectedValue = chartViewModel.selectedValues.first {
                return "Selected Value: \(selectedValue)"
            } else {
                return "Select a value"
            }
        }
    
    private func updateSelectedValue(_ value: String) {
            chartViewModel.selectedValues = [value]
            fetchSensorData()
        }
    
    private func fetchSensorData() {
            if let deviceName = selectedDevice?.deviceName {
                chartViewModel.fetchSensorData(for: deviceName, date: formattedSelectedDate)
            }
        }
    
    private var formattedSelectedDate: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: selectedDate)
        }
}











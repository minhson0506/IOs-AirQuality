//
//  ChartView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct ChartView: View {
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                CalendarView(selectedDate: $selectedDate)
                Text("Selected Date: \(formattedSelectedDate)")
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private var formattedSelectedDate: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: selectedDate)
        }
}











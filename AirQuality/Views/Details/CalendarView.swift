//
//  CalenderView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 10.5.2023.
//

import SwiftUI


struct CalendarView: View {
    @Binding var selectedDate: Date
    @State private var displayedWeek: Date = Date()
    private let calendar = Calendar.current
    
    var body: some View {
        VStack {
            Text("\(monthString(from: startOfWeek())) \(yearString(from: startOfWeek()))")
                .font(.title)
                        
            
            HStack {
                Button(action: {
                    displayedWeek = calendar.date(byAdding: .weekOfYear, value: -1, to: displayedWeek)!
                }) {
                    Image(systemName: "chevron.left")
                }
                
                ForEach(0..<7) { index in
                    let date = calendar.date(byAdding: .day, value: index, to: startOfWeek())!
                    VStack {
                        Text(dayString(from: date))
                            .font(.headline)
                        Text("\(calendar.component(.day, from: date))")
                            .font(.subheadline)
                    }
                    .foregroundColor(isCurrentDate(date) ? .red : .primary) // Highlight current date
                    .background(selectedDate.isSameDay(as: date) ? Color.yellow : Color.clear) // Highlight background of selected date
                    .onTapGesture {
                        selectedDate = date // Update selectedDate
                    }
                }
                
                Button(action: {
                    displayedWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: displayedWeek)!
                }) {
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding()
    }
    
    private func startOfWeek() -> Date {
        let weekday = calendar.component(.weekday, from: displayedWeek)
        let startOfWeek = calendar.date(byAdding: .day, value: -weekday + 1, to: displayedWeek)!
        return startOfWeek
    }
    
    private func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
    
    private func isCurrentDate(_ date: Date) -> Bool {
        return calendar.isDate(date, inSameDayAs: Date())
    }
    
    private func monthString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: date)
    }

    private func yearString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: date)
    }
}

extension Date {
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}






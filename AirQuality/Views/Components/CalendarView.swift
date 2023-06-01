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
            Text("\(monthString(from: startOfWeek()))")
                .font(.headline)
                        
            
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
                            .foregroundColor(isCurrentDate(date) ? .white : (selectedDate.isSameDay(as: date) ? .white : .primary)) // Update text color

                        Text("\(calendar.component(.day, from: date))")
                            .font(.subheadline)
                            .foregroundColor(isCurrentDate(date) ? .white : (selectedDate.isSameDay(as: date) ? .white : .primary)) // Update text color

                    }
                    .foregroundColor(isCurrentDate(date) ? .white : .primary) // Highlight current date
                    .background(backgroundForDate(date)) // Apply background for the date
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
        let startDate = startOfWeek()
        let endDate = calendar.date(byAdding: .day, value: 6, to: startDate)!
        
        let startMonth = calendar.component(.month, from: startDate)
        let endMonth = calendar.component(.month, from: endDate)
        
        let startYear = calendar.component(.year, from: startDate)
        let endYear = calendar.component(.year, from: endDate)
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        
        if startMonth != endMonth || startYear != endYear {
            let startMonthString = monthFormatter.string(from: startDate)
            let endMonthString = monthFormatter.string(from: endDate)
            
            if startYear != endYear {
                return "\(startMonthString) \(startYear) - \(endMonthString) \(endYear)"
            } else {
                return "\(startMonthString) - \(endMonthString) \(startYear)"
            }
        } else {
            return "\(monthFormatter.string(from: startDate)) \(startYear)"
        }
    }


    
    private func backgroundForDate(_ date: Date) -> some View {
        let isSelected = selectedDate.isSameDay(as: date)
        let isCurrent = isCurrentDate(date)
        
        return Circle()
            .frame(width: isSelected || isCurrent ? 40 : 40, height: isSelected || isCurrent ? 40 : 40)
            .foregroundColor(isSelected||isCurrent ? .white  : .clear)
            .overlay(
                Circle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                    .opacity(isSelected || isCurrent ? 1 : 0)
            )
    }

}

extension Date {
    func isSameDay(as date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }
}






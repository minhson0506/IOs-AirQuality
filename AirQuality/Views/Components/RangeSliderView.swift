//
//  RangeSliderView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 1.6.2023.
//

import SwiftUI

struct RangeSliderView: View {
    var name: String
    @State private var rangeValue: RangeValue
    
    init(name: String, initialMinValue: Double, initialMaxValue: Double) {
        self.name = name
        _rangeValue = State(initialValue: RangeValue(minValue: initialMinValue, maxValue: initialMaxValue))
    }
    
    var body: some View {
        VStack {
            Text(name)
            HStack {
                Slider(value: $rangeValue.minValue, in: 0...100)
                Slider(value: $rangeValue.maxValue, in: rangeValue.minValue...100)
            }
        }
        .onChange(of: rangeValue) { newValue in
            saveValuesToUserDefaults()
        }
        .onAppear {
            loadValuesFromUserDefaults()
        }
    }
    
    private func saveValuesToUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(rangeValue), forKey: name)
    }
    
    private func loadValuesFromUserDefaults() {
        let defaults = UserDefaults.standard
        if let data = defaults.value(forKey: name) as? Data,
           let savedRangeValue = try? PropertyListDecoder().decode(RangeValue.self, from: data) {
            rangeValue = savedRangeValue
        }
    }
}

struct RangeValue: Codable, Equatable {
    var minValue: Double
    var maxValue: Double
}









//
//  Slider.swift
//  AirQuality
//
//  Created by Chi Nguyen on 2.6.2023.
//

import Foundation
import SwiftUI
import Combine

//SliderValue to restrict double range: 0.0 to 1.0
@propertyWrapper
struct SliderValue {
    var value: Double
    
    init(wrappedValue: Double) {
        self.value = wrappedValue
    }
    
    var wrappedValue: Double {
        get { value }
        set { value = min(max(0.0, newValue), 1.0) }
    }
}


class SliderHandle: ObservableObject {
    let sliderWidth: CGFloat
    let sliderHeight: CGFloat
    let sliderValueStart: Double
    let sliderValueRange: Double
    
    var diameter: CGFloat = 40
    var startLocation: CGPoint
    
    @Published var currentPercentage: SliderValue
    
    @Published var onDrag: Bool
    @Published var currentLocation: CGPoint
    
    var currentValue: Double {
        get {
            return sliderValueStart + currentPercentage.wrappedValue * sliderValueRange
        }
        set {
            let percentage = (newValue - sliderValueStart) / sliderValueRange
            currentPercentage.wrappedValue = percentage
        }
    }
    
    init(sliderWidth: CGFloat, sliderHeight: CGFloat, sliderValueStart: Double, sliderValueEnd: Double, startPercentage: SliderValue) {
        self.sliderWidth = sliderWidth
        self.sliderHeight = sliderHeight
        self.sliderValueStart = sliderValueStart
        self.sliderValueRange = sliderValueEnd - sliderValueStart
        
        let startLocation = CGPoint(x: (CGFloat(startPercentage.wrappedValue)/1.0)*sliderWidth, y: sliderHeight/2)
        self.startLocation = startLocation
        self.currentLocation = startLocation
        self.currentPercentage = startPercentage
        
        self.onDrag = false
    }
    
    lazy var sliderDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>  = DragGesture()
        .onChanged { value in
            self.onDrag = true
            
            let dragLocation = value.location
            
            //Restrict possible drag area
            self.restrictSliderBtnLocation(dragLocation)
            
            //Get current value
            self.currentPercentage.wrappedValue = Double(self.currentLocation.x / self.sliderWidth)
            
        }.onEnded { _ in
            self.onDrag = false
        }
    
    private func restrictSliderBtnLocation(_ dragLocation: CGPoint) {
        //On Slider Width
        if dragLocation.x > CGPoint.zero.x && dragLocation.x < sliderWidth {
            calcSliderBtnLocation(dragLocation)
        }
    }
    
    private func calcSliderBtnLocation(_ dragLocation: CGPoint) {
        if dragLocation.y != sliderHeight/2 {
            currentLocation = CGPoint(x: dragLocation.x, y: sliderHeight/2)
        } else {
            currentLocation = dragLocation
        }
    }
}



class CustomSlider: ObservableObject {
    // Slider Size
    let width: CGFloat = 300
    let lineWidth: CGFloat = 8
    
    // Slider value range from valueStart to valueEnd
    let valueStart: Double
    let valueEnd: Double
    
    // Slider Handle
    @Published var highHandle: SliderHandle
    @Published var lowHandle: SliderHandle
    
    // Name of slider
    let name: String
    
    // Handle start percentage (also for starting point)
    @SliderValue var highHandleStartPercentage = 1.0
    @SliderValue var lowHandleStartPercentage = 0.0
    
    var anyCancellableHigh: AnyCancellable?
    var anyCancellableLow: AnyCancellable?
    
    @Published var lowHandleValue: Double = 0.0
    @Published var highHandleValue: Double = 0.0
    
    init(start: Double, end: Double, name: String) {
        valueStart = start
        valueEnd = end
        
        highHandle = SliderHandle(sliderWidth: width,
                                  sliderHeight: lineWidth,
                                  sliderValueStart: valueStart,
                                  sliderValueEnd: valueEnd,
                                  startPercentage: _highHandleStartPercentage
        )
        
        lowHandle = SliderHandle(sliderWidth: width,
                                 sliderHeight: lineWidth,
                                 sliderValueStart: valueStart,
                                 sliderValueEnd: valueEnd,
                                 startPercentage: _lowHandleStartPercentage
        )
        self.name = name
        
        // Load values from storage
        loadSliderValuesFromStorage()
        
        // Subscribe to changes in lowHandle and highHandle to save values to storage
        anyCancellableHigh = highHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
            self.highHandleValue = self.highHandle.currentValue
            self.saveSliderValuesToStorage()
        }
                
        anyCancellableLow = lowHandle.objectWillChange.sink { _ in
            self.objectWillChange.send()
            self.lowHandleValue = self.lowHandle.currentValue
            self.saveSliderValuesToStorage()
        }
    }
    
    // Percentages between high and low handle
    var percentagesBetween: String {
        return String(format: "%.2f", highHandle.currentPercentage.wrappedValue - lowHandle.currentPercentage.wrappedValue)
    }
    
    // Value between high and low handle
    var valueBetween: String {
        return String(format: "%.2f", highHandle.currentValue - lowHandle.currentValue)
    }
    
    // Save lowHandle and highHandle values to storage
    private func saveSliderValuesToStorage() {
        // Save lowHandle value to storage
        UserDefaults.standard.set(lowHandle.currentValue, forKey: "\(name)_lowHandle")
            
        // Save highHandle value to storage
        UserDefaults.standard.set(highHandle.currentValue, forKey: "\(name)_highHandle")
            
        // Synchronize UserDefaults
        UserDefaults.standard.synchronize()
    }
        
    // Load lowHandle and highHandle values from storage
    private func loadSliderValuesFromStorage() {
        if let lowHandleValue = UserDefaults.standard.value(forKey: "\(name)_lowHandle") as? Double {
            self.lowHandleValue = lowHandleValue
            lowHandle.currentValue = lowHandleValue
        } else {
            self.lowHandleValue = lowHandle.currentValue
        }
            
        if let highHandleValue = UserDefaults.standard.value(forKey: "\(name)_highHandle") as? Double {
            self.highHandleValue = highHandleValue
            highHandle.currentValue = highHandleValue
        } else {
            self.highHandleValue = highHandle.currentValue
        }
    }
}


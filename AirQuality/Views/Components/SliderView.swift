//
//  SliderView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 2.6.2023.
//

import SwiftUI

struct SliderView: View {
    @ObservedObject var slider: CustomSlider
    var name: String
    
    var body: some View {
        VStack{
            Text("\(name) - Start: \(String(format: "%.2f", slider.valueStart)) --- End: \(String(format: "%.2f", slider.valueEnd))")
                .font(.subheadline)

            RoundedRectangle(cornerRadius: slider.lineWidth)
                .fill(Color.gray.opacity(0.2))
                .frame(width: slider.width, height: slider.lineWidth)
                .overlay(
                    ZStack {
                        //Path between both handles
                        SliderPathBetweenView(slider: slider)
                        
                        //Low Handle
                        SliderHandleView(handle: slider.lowHandle)
                            .highPriorityGesture(slider.lowHandle.sliderDragGesture)
                        
                        //High Handle
                        SliderHandleView(handle: slider.highHandle)
                            .highPriorityGesture(slider.highHandle.sliderDragGesture)
                    }
                )
        }
        .padding()
        .onChange(of: slider.lowHandle.currentValue) { newValue in
            print("\(name) lowHandle value changed: \(newValue)")
            saveSliderValuesToStorage()
        }
        .onChange(of: slider.highHandle.currentValue) { newValue in
            print("\(name) highHandle value changed: \(newValue)")
            saveSliderValuesToStorage()
        }
        
    }
    // Save lowHandle and highHandle values to storage
        private func saveSliderValuesToStorage() {
            // Save lowHandle value to storage
            UserDefaults.standard.set(slider.lowHandle.currentValue, forKey: "\(name)_lowHandle")
            
            // Save highHandle value to storage
            UserDefaults.standard.set(slider.highHandle.currentValue, forKey: "\(name)_highHandle")
            
            // Synchronize UserDefaults
            UserDefaults.standard.synchronize()
        }
}


struct SliderHandleView: View {
    @ObservedObject var handle: SliderHandle
    
    var body: some View {
        Circle()
            .frame(width: handle.diameter, height: handle.diameter)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
            .scaleEffect(handle.onDrag ? 1.3 : 1)
            .contentShape(Rectangle())
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
        
        Text("\(String(format: "%.2f", handle.currentValue))")
            .font(.system(size: 10))
            .foregroundColor(.black)
            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
    }
}

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.blue, lineWidth: slider.lineWidth)
    }
}

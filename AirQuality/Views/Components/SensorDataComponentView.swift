//
//  SwiftUIView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 28.4.2023.
//

import SwiftUI

struct SensorDataComponentView: View {
    let displayData: SensorDataDisplay
    @State private var isInfoDisplayed = false

    var body: some View {
        VStack  {
            HStack{
                Image(systemName: "\(displayData.image)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundColor(.white)
                    .padding()
                Text(displayData.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
             Text(displayData.value)
                .font(.title)
                .fontWeight(.bold)
            
            Text(displayData.unit)
                .font(.footnote)
                .fontWeight(.medium)
            
        }
        .frame(width: 150, height: 70)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding(20)
        .shadow(radius: 15)
        .background(.yellow)
    }
}


struct SensorDataComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SensorDataComponentView(displayData: SensorDataDisplay(id: UUID(), image: "speaker.wave.2", name: "Noise", value: "60.97", unit: "dB", desc: "Hello"))
    }
}

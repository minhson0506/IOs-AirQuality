//
//  ExtraInfoView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 1.6.2023.
//

import SwiftUI

struct ExtraInfoView: View {
    @Binding var extraInfo: String
    
    var body: some View {
        VStack {
            Text("Extra Information")
                .font(.headline)
                .padding()
            
            Text(extraInfo)
                .font(.subheadline)
                .padding()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}



//
//  ChartView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        NavigationView {
            Text("Chart")
                .navigationTitle("Chart")
        }
        .navigationViewStyle(.stack)

    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

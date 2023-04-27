//
//  HomeView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 18.4.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var allDevicesVM: AllDevicesViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(allDevicesVM.allDevices.indices, id: \.self){ index in
                    Text(allDevicesVM.allDevices[index].deviceName)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AllDevicesViewModel())
    }
}

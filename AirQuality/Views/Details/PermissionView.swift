//
//  PermissionView.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import SwiftUI

struct PermissionView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @ObservedObject var allDeviceVM = AllDevicesViewModel()
    
    var body: some View {
        //Display view depends on the authorizationStatus
                switch locationViewModel.authorizationStatus {
                // When the status is not determined, display asking permission view
                case .notDetermined:
                    RequestLocationView()
                // When the use refused, user can process to the app with limited view
                // When the use allowed, go to NavigationTabView
                case .authorizedWhenInUse, .authorizedAlways, .denied, .restricted:
                    TabBar(devices: allDeviceVM.allDevices)
                default:
                    Text("Default")
                }
    }
    
}

struct RequestLocationView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var body: some View {
        ZStack {
            Color("Blue").ignoresSafeArea()
            VStack {
                Spacer()
                Image("landing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
                Text("Welcome to Air Quality")
                    .font(.system(size: 28, weight: .semibold))
                Spacer()
                Button {
                    locationViewModel.requestPermission()
                } label: {
                    Text("Allow location")
                        .padding()
                        .font(.headline)
                        .foregroundColor(Color("Blue"))
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal, 50)
                .padding()
                Spacer()
                    
            }
            .foregroundColor(.white)
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct PermissionView_Previews: PreviewProvider {
//    static var previews: some View {
//        PermissionView()
//    }
//}

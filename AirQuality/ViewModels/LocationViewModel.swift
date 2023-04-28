//
//  LocationViewModel.swift
//  AirQuality
//
//  Created by Chi Nguyen on 27.4.2023.
//

import Foundation
import CoreLocation
import MapKit


class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var userLocation: CLLocation?
    @Published var userCity: CLPlacemark?
    @Published var region: MKCoordinateRegion = .init(
        center: CLLocationCoordinate2D(latitude: 60.192059, longitude: 24.945831),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    private let manager: CLLocationManager
    
    override init() {
        manager = CLLocationManager()
        authorizationStatus = manager.authorizationStatus
        
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    // Request permission to get user's location function
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    // Get authorization status from location manager
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    // Get last location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first
        fetchCity(for: userLocation)
        guard let latestLocation = userLocation else {
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: latestLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
    
    // Fetch city based on current location
    func fetchCity(for location: CLLocation?) {
        guard let location = location else { return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, _ in
            self.userCity = placemarks?.first
        }
    }
}


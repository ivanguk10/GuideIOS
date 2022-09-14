//
//  MapViewModel.swift
//  GuideIOS
//
//  Created by MacBookPro on 12/09/2022.
//

import Foundation
import CoreLocation
import MapKit

final class MapViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var isMenuOpened = false
    
    
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    private var locationManager: CLLocationManager?
    
    
    func menuClicked() {
        isMenuOpened = !isMenuOpened
    }
    
    func checkIfLocationServicesIsEnbled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Location Services disabled")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("You dennied this permission, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(
                center: locationManager.location!.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

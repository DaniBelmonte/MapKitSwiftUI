//
//  ContentView.swift
//  MapKitSwiftUI
//
//  Created by Dani on 27/12/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {

    var body: some View {
        MapView()
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let currentLocation = locationManager.location {
            let region = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            uiView.setRegion(region, animated: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

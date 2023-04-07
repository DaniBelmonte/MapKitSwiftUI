//
//  MapView.swift
//  MapKitSwiftUI
//
//  Created by Dani on 7/4/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        let button = MKUserTrackingButton(mapView: mapView)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(button)

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -20),
            button.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20)
        ])

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        if let currentLocation = locationManager.location {
            let region = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 400, longitudinalMeters: 400)
            uiView.setRegion(region, animated: true)
        }
    }
}

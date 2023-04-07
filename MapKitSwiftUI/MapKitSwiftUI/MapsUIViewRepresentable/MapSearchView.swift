//
//  MapSearchView.swift
//  MapKitSwiftUI
//
//  Created by Dani on 7/4/23.
//

import SwiftUI
import MapKit

struct MapSearchView: UIViewRepresentable {
    var selectedMapItem: MKMapItem?
    var searchResults: [MKMapItem]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        if let selectedMapItem = selectedMapItem {
            mapView.removeAnnotations(mapView.annotations)
            let annotation = MKPointAnnotation()
            annotation.coordinate = selectedMapItem.placemark.coordinate
            annotation.title = selectedMapItem.name
            annotation.subtitle = selectedMapItem.placemark.title
            mapView.addAnnotation(annotation)
            mapView.selectAnnotation(annotation, animated: true)
            let region = MKCoordinateRegion(center: selectedMapItem.placemark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            mapView.setRegion(region, animated: true)
        } else {
            mapView.removeAnnotations(mapView.annotations)
        }
    }
}

struct Previews_MapSearchView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

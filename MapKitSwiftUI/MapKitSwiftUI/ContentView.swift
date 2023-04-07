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
        TabView {
            MapView()
                .tabItem {
                    Text("Current Location")
                    Image(systemName: "mappin.circle")
                }
            MapSearchLocationView()
                .tabItem {
                    Text("Search Lotation")
                    Image(systemName: "magnifyingglass.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

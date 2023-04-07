//
//  MapSearchView.swift
//  MapKitSwiftUI
//
//  Created by Dani on 7/4/23.
//

import SwiftUI
import MapKit


struct MapSearchLocationView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
    @State private var selectedMapItem: MKMapItem? = nil

    var body: some View {
        VStack {
            MapSearchView(selectedMapItem: selectedMapItem, searchResults: searchResults)
                .edgesIgnoringSafeArea(.all)
            TextField("Search for a location", text: $searchText, onCommit: searchForLocation)
                .padding(.horizontal)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Search", action: searchForLocation)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.top, 8)
            List(searchResults, id: \.self) { mapItem in
                VStack(alignment: .leading) {
                    Text(mapItem.name ?? "")
                    Text(mapItem.placemark.title ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .onTapGesture {
                    self.selectedMapItem = mapItem
                }
            }
            .frame(height: 150)
        }
    }

    func searchForLocation() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: searchRequest)
        search.start(completionHandler: { (response, error) in
            guard let response = response else {
                print("Error searching for locations: \(error?.localizedDescription ??  "Error")")
                return
            }
            self.searchResults = response.mapItems
            self.selectedMapItem = response.mapItems.first
        })
    }
}

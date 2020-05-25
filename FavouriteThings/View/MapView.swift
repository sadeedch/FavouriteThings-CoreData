//
//  MapView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 26/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @ObservedObject var things: Things
    @ObservedObject var locModel: LocationModel
   
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        map.delegate = locModel
        return map
    }
    
    func updateUIView(_ map: MKMapView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(latitude: Double(self.things.boundLatitude) ?? 0, longitude: Double(self.things.boundLongitude) ?? 0)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5_000, longitudinalMeters: 5_000)
        map.setRegion(region, animated: true)
    }
    
    
}



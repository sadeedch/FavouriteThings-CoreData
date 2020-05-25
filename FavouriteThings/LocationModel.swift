//
//  LocationModel.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 26/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//


import Foundation
import SwiftUI
import MapKit


class LocationModel: NSObject, MKMapViewDelegate, ObservableObject, Identifiable {
    @Published var location: Things
    
    
    init(thing: Things) {
        self.location = thing
    }
}

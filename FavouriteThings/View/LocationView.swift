//
//  SwiftUIView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 22/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct LocationView: View {
    @ObservedObject var location: Things
    @Environment(\.managedObjectContext) var context
    @State var currentPosition = CLLocationCoordinate2D()
    
    @State var locationName = ""
    @State var latitudeString = ""
    @State var longitudeString = ""
    
                                
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Location Name...")
                TextField("Enter location name", text: self.$locationName, onCommit: {
                    let geoCoder = CLGeocoder()
                    let region = CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                    
                    geoCoder.geocodeAddressString(self.locationName, in: region) { (placemarks, error ) in
                        guard let location = placemarks?.first?.location else {
                            print("Error locating '\(self.locationName)': \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        
                        let position = location.coordinate
                        self.currentPosition.latitude = position.latitude
                        self.currentPosition.longitude = position.longitude
                        self.latitudeString = "\(position.latitude)"
                        self.longitudeString = "\(position.longitude)"
                        
                    }
                    
                })
            }
            
            HStack {
                Text("Latitude...")
                TextField("Enter location name", text: self.$latitudeString)
            }
               
            
            
            HStack {
                Text("Longitude...")
                TextField("Enter location name", text: self.$longitudeString)
            }
           
            
            
        }
        
        
        
        
        
        
    }
}




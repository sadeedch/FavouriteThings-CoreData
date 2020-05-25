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
    @ObservedObject var keyboard = Keyboard()
    @State var currentPosition = CLLocationCoordinate2D()
    
    
    @State var locationName: String         // locationName : a temporary variable to hold the location name
    @State var latitudeString: String       // latitudeString : a temporary variable to hold the latitude coordinates
    @State var longitudeString: String      // longitudeString : a temporary variable to hold the longitude coordinates
    
    var body: some View {
        
        ScrollView(.vertical){
        
            VStack(alignment: .center){
                
                
                // Displays the map
                MapView(things: location, locModel: LocationModel(thing: location))
                    .padding(3.0)
                    .frame(width: 400, height: 300, alignment: .top)
                    
                
            
                
                HStack {
                    Text("Location Name")   // Displays the location name
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Enter location..", text: self.$locationName, onCommit: {
                        // updates the map location, longitude and latitude when location name is updated
                        let geoCoder = CLGeocoder()
                        let region = CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                        
                        geoCoder.geocodeAddressString(self.locationName, in: region) { (placemarks, error ) in
                            guard let location = placemarks?.first?.location
                                else {
                                    print("Error locating '\(self.locationName)': \(error.map {"\($0)"} ?? "<unknown error>")")
                                    return
                                }
                            let position = location.coordinate
                            self.currentPosition.latitude = position.latitude
                            self.currentPosition.longitude = position.longitude
                            self.location.boundLatitude = "\(position.latitude)"
                            self.latitudeString = self.location.boundLatitude
                            self.location.boundLongitude = "\(position.longitude)"
                            self.longitudeString = self.location.boundLongitude
                            self.location.boundLoaction = self.locationName
                            
                        }
                    try? self.context.save()
                    })
                }
                
                
                HStack {
                    Text("Latitude")        // Displays the location latitude
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Enter latitude..", text: self.$latitudeString, onEditingChanged: { _ in try? self.context.save() },  onCommit: {
                        
                        // updates the location name and map when latitude is updated
                        guard let latitude = CLLocationDegrees(self.latitudeString),
                              let longitude = CLLocationDegrees(self.longitudeString)
                            else {
                                print("Invalid Coordinates")
                                return
                            }
                        self.currentPosition.latitude = latitude
                        self.currentPosition.longitude = longitude
                        let geoCoder = CLGeocoder()
                        let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)

                        geoCoder.reverseGeocodeLocation(position) { (placemarks, error ) in
                            guard let placemark = placemarks?.first
                                else {
                                    print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude) / : \(error.map {"\($0)"} ?? "<unknown error>")")
                                    return
                                }
                            
                            self.locationName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                            
                            self.location.boundLoaction = self.locationName
                            self.location.boundLatitude = self.latitudeString
                            self.location.boundLongitude = self.longitudeString
                            
                        }
                    try? self.context.save()
                    })
                }
                   
                
                
                HStack {
                    Text("Longitude")    // Displays the location longitude
                        .fontWeight(.bold)
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Enter longitude..", text: self.$longitudeString, onEditingChanged: { _ in try? self.context.save() }, onCommit: {
                         // updates the location name and map when longitude is updated
                        guard let latitude = CLLocationDegrees(self.latitudeString),
                              let longitude = CLLocationDegrees(self.longitudeString)
                            else {
                                print("Invalid Coordinates")
                                return
                            }
                        
                        self.currentPosition.latitude = latitude
                        self.currentPosition.longitude = longitude
                        let geoCoder = CLGeocoder()
                        let position = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                        
                        geoCoder.reverseGeocodeLocation(position) { (placemarks, error ) in
                            guard let placemark = placemarks?.first
                                else {
                                    print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude) / : \(error.map {"\($0)"} ?? "<unknown error>")")
                                    return
                                }
                            
                            self.locationName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                            
                            self.location.boundLoaction = self.locationName
                            self.location.boundLatitude = self.latitudeString
                            self.location.boundLongitude = self.longitudeString
                            
                        }
                    try? self.context.save()
                    })
                }
                }
        }.frame(width: 300)
         .offset(x: 0, y: CGFloat(-(keyboard.h + 50)))
    }
}




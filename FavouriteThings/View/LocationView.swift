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
    
    @State var locationName = ""
    @State var latitudeString = ""
    @State var longitudeString = ""
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            
            //displaying the map
            MapView(things: location, locModel: LocationModel(thing: location))
                .frame(width: 400, height: 300, alignment: .top)
            
            HStack {
                Text("Location Name")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.leading)
                TextField("Enter location..", text: self.$locationName, onCommit: {
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
                        self.latitudeString = "\(position.latitude)"
                        self.longitudeString = "\(position.longitude)"
                        
                    }
                try? self.context.save()
                })
            }
            
            
            HStack {
                Text("Latitude")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.leading)
                TextField("Enter latitude..", text: self.$latitudeString, onCommit: {
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
                        
                    }
                try? self.context.save()
                })
            }
               
            
            
            HStack {
                Text("Longitude")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.leading)
                TextField("Enter longitude..", text: self.$longitudeString, onCommit: {
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
                        
                    }
                try? self.context.save()
                })
            }
        }.frame(width: 300)
        .offset(x: 0, y: CGFloat(-(keyboard.h + 50)))
    }
}




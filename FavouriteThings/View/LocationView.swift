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
                TextField("Enter location name", text: self.$locationName)
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




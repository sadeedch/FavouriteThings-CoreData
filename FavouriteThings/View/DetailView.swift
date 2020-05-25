//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation


import SwiftUI



// This Detail View shows the details of all the ground including its different properties.
struct DetailView: View {
    @ObservedObject var things: Things    //Singular instance of things containing data
    @ObservedObject var keyboard = Keyboard()
    @Environment(\.managedObjectContext) var context
    @State var tempImageURL: String = ""      // tempImageURL : a temporary variable to hold the url of image entered by user
    var body: some View {
        ScrollView(.vertical){
        VStack(alignment: .center) {               // all the Things data shown in this view is included in this Vertical Stack.
            
           
            
            
            VStack() {  // This vertical stack shows the image and Text Field to enter url for a new image

                
                //downloadedImage function being used here to display the image
                downloadedImage(things.url ?? "default")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .multilineTextAlignment(.center)
            }.frame(width: 350, height: nil)
            
            // Vertical Stack to show the Ground name and sports type.
            VStack() {
                
                TextField("Item name...", text: $things.boundName)
                    .font(.largeTitle)
                
                TextField("Sports Type...", text: $things.boundSportsType)
                    .font(.subheadline)
                    .padding(.bottom)
                    
                 }.frame(width: 300, alignment: .leading)
            
            //VStack() {
            NavigationLink(destination: LocationView(location: things, locationName: things.boundLoaction, latitudeString: things.boundLatitude, longitudeString: things.boundLongitude )) {
                Text("Loaction:").bold()
            }
            
           VStack(alignment: .center) {  // This vertical stack shows the Text Field to enter the notes
                Text("Image URL:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.leading)
                /*  text field to enter the url of new image for a thing and the entered url is bounded to $tempImageURL.
                    this temporary value is then sent to the url property of class things. */
                TextField("Paste the image URL here", text: $tempImageURL, onEditingChanged: {
                    _ in try? self.context.save()
                }, onCommit: { self.things.url = self.tempImageURL})
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            
                Text("Notes:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                    .multilineTextAlignment(.leading)
                    //  text field to enter the notes and the entered text is bounded to things.boundNotes
                TextField("Enter your notes...", text: $things.boundNotes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }.frame(width: 350, height: nil)
        
            
            VStack(){
                // Showing the title field of capcaity of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Capacity..", text: $things.boundTitle_field1)
                    TextField("Enter capacity...", text: $things.boundCapacity)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Showing the title field of opening date of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Opened..", text: $things.boundTitle_field2)
                    TextField("Enter opening date...", text: $things.boundOpened)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                // Showing the title field of owner name of a ground and its value. Both the fields are editable.
                HStack {
                    TextField("Owner..", text: $things.boundTitle_field3)
                    TextField("Enter owner", text: $things.boundOwner)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }.frame(width: 300, alignment: .leading)
        }
        }.offset(x: 0, y: CGFloat(-(keyboard.h)))
    }
}


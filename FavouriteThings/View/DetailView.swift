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
    @Environment(\.managedObjectContext) var context
    @State var tempImageURL: String = ""      // tempImageURL : a temporary variable to hold the url of image entered by user
    var body: some View {
        
        VStack() {               // all the Things data shown in this view is included in this Vertical Stack.
            
            VStack() {  // This vertical stack shows the Text Field to enter the notes
                
                Text("Notes:")
                    .font(.body)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                //  text field to enter the notes and the entered text is bounded to things.notes
                TextField("Enter your notes...", text: $things.boundNotes, onEditingChanged: {
                    _ in try? self.context.save()
                })
                //.textFieldStyle(RoundedBorderTextFieldStyle())
            }//.frame(width: 350, height: nil)
            
            
            VStack(alignment: .leading) {  // This vertical stack shows the image and Text Field to enter url for a new image
                Text("Image URL:")
                    .fontWeight(.bold)
                    .font(Font.system(size: 20))
                /*  text field to enter the url of new image for a thing and the entered url is bounded to $tempImageURL.
                    this temporary value is then sent to the url property of class things. */
                TextField("Paste the image URL here", text: $tempImageURL, onCommit: { self.things.url = self.tempImageURL
                    }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                downloadedImage(things.boundUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
                .multilineTextAlignment(.center)
            }//.frame(width: 350, height: nil)
            
           
        
            // Vertical Stack to show the Ground name and location.
            VStack() {
                
                TextField("Item name...", text: $things.boundName)
                    .font(.largeTitle)
                
                TextField("Location...", text: $things.boundLocation)
                    .font(.subheadline)
                    .padding(.bottom)
                    
                 }.frame(width: 300, alignment: .leading)
            
            
            
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
            }//.frame(width: 300, alignment: .leading)
        }
    }
}

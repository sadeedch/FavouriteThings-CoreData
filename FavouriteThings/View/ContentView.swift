//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

// content view to display the MasterView to be displayed
struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ThingsList.title, ascending: true)], animation: .default) var thingsList: FetchedResults<ThingsList>
    var body: some View {
       NavigationView {
        MasterView(thingsList: thingsList.first ?? ThingsList (context: context))
           
            /*  leading: EditButton() - specifies the edit button in the navigation bar on the left side
                trailing: Button(action) - specifies the add button in the navigation bar on the right side
                If the user clicks on add button, then it appends the ground array to add a new ground entry which is specified
                in action. */
            .navigationBarItems(leading: EditButton(),
            trailing: Button( action: {
                  withAnimation { //adding a new entry
                    let new = Things(context: self.context)
                    new.thingslist = self.thingsList.first
                    try? self.context.save()
                    
                }
            }){ Image(systemName: "plus")})
        }
    }
}





//
//  RowView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import Foundation

import SwiftUI


// RowView is an extracted view from the master view. It shows the image, name and location of each ground in a list.
struct RowView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var thingsRow: Things
    var body: some View {
        // This horizontal stack contains the Ground image, Ground name and its location.
        HStack {
            //downloadedImage function being used here to display the image
            downloadedImage(thingsRow.url ?? "default")
                .resizable()
                .frame(width: 120, height: 120)
            Text(self.thingsRow.boundName).bold()     //  shows the ground name
            Text(self.thingsRow.boundLocation)        //  shows the ground location
        }
    }
}

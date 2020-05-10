//
//  ThingsList+ViewModel.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//
import CoreData
import Foundation

extension ThingsList {
    
    // Creating variable child which takes the Things array
    var child: [Things] {
        get { things?.array as? [Things] ?? [] }
        set { things =  NSOrderedSet(array: newValue) }
    }
    
    // variable boundTitle getting the title value from CoreData
    var boundTitle: String {
        get{ title ?? ""}
        set{ title = newValue}
    }
    
    
}

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
    
    var child: [Things] {
        get { things?.array as? [Things] ?? [] }
        set { things =  NSOrderedSet(array: newValue) }
    }
    
    var boundTitle: String {
        get{ title ?? ""}
        set{ title = newValue}
    }
    
    
}

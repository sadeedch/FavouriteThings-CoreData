//
//  Things+ModelView.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 8/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//

import CoreData
import Foundation

extension Things {
    
    var boundUrl: String {
        get{ url ?? ""}
        set{ url = newValue}
    }
    var boundName: String {
        get{ name ?? ""}
        set{ name = newValue}
    }
    
    var boundLocation: String {
        get{ location ?? ""}
        set{ location = newValue}
    }
    
    var boundCapacity: String {
        get{ capacity ?? ""}
        set{ capacity = newValue}
    }
    var boundOpened: String {
        get{ opened ?? ""}
        set{ opened = newValue}
    }
    
    var boundOwner: String {
        get{ owner ?? ""}
        set{ owner = newValue}
    }
    var boundNotes: String {
        get{ notes ?? ""}
        set{ notes = newValue}
    }
    
    var boundTitle_field1: String {
        get{ title_field1 ?? ""}
        set{ title_field1 = newValue}
    }
    var boundTitle_field2: String {
        get{ title_field2 ?? ""}
        set{ title_field2 = newValue}
    }
    var boundTitle_field3: String {
        get{ title_field3 ?? ""}
        set{ title_field3 = newValue}
    }
    
    
}
  

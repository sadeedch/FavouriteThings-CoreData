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
    
    
    // variable boundUrl getting the url value from CoreData
    var boundUrl: String {
        get{ url ?? ""}
        set{ url = newValue}
    }
    
    // variable boundName getting the name value from CoreData
    var boundName: String {
        get{ name ?? ""}
        set{ name = newValue}
    }
    
    // variable boundLocation getting the location value from CoreData
    var boundSportsType: String {
        get{ sportsType ?? ""}
        set{ sportsType = newValue}
    }
    
    // variable boundCapacity getting the capacity value from CoreData
    var boundCapacity: String {
        get{ capacity ?? ""}
        set{ capacity = newValue}
    }
    
    // variable boundOpened getting the opened value from CoreData
    var boundOpened: String {
        get{ opened ?? ""}
        set{ opened = newValue}
    }
    
    // variable boundOwner getting the owner value from CoreData
    var boundOwner: String {
        get{ owner ?? ""}
        set{ owner = newValue}
    }
    
    // variable boundNotes getting the notes value from CoreData
    var boundNotes: String {
        get{ notes ?? ""}
        set{ notes = newValue}
    }
    
    // variable boundTitle_field1 getting the title1 value from CoreData
    var boundTitle_field1: String {
        get{ title_field1 ?? ""}
        set{ title_field1 = newValue}
    }
    
    // variable boundTitle_field2 getting the title2 value from CoreData
    var boundTitle_field2: String {
        get{ title_field2 ?? ""}
        set{ title_field2 = newValue}
    }
    
    // variable boundTitle_field3 getting the title3 value from CoreData
    var boundTitle_field3: String {
        get{ title_field3 ?? ""}
        set{ title_field3 = newValue}
    }
    
    // variable boundLoaction getting the location value from CoreData
    var boundLoaction: String {
        get{ location ?? ""}
        set{ location = newValue}
    }
    
    // variable boundLatitude getting the latitude value from CoreData
    var boundLatitude: String {
        get{ latitude ?? ""}
        set{ latitude = newValue}
    }

    // variable boundLongitude getting the longitude value from CoreData
    var boundLongitude: String {
        get{ longitude ?? ""}
        set{ longitude = newValue}
    }

    
    
}
  

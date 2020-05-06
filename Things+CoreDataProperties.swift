//
//  Things+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//
//

import Foundation
import CoreData


extension Things {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Things> {
        return NSFetchRequest<Things>(entityName: "Things")
    }

    @NSManaged public var capacity: String?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var opened: String?
    @NSManaged public var owner: String?
    @NSManaged public var title_field1: String?
    @NSManaged public var title_field2: String?
    @NSManaged public var title_field3: String?
    @NSManaged public var url: String?
    @NSManaged public var thingslist: ThingsList?

}

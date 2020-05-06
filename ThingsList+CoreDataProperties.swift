//
//  ThingsList+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Sadeed Ahmed  on 7/5/20.
//  Copyright © 2020 Sadeed Ahmad. All rights reserved.
//
//

import Foundation
import CoreData


extension ThingsList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThingsList> {
        return NSFetchRequest<ThingsList>(entityName: "ThingsList")
    }

    @NSManaged public var title: String?
    @NSManaged public var things: NSOrderedSet?

}

// MARK: Generated accessors for things
extension ThingsList {

    @objc(insertObject:inThingsAtIndex:)
    @NSManaged public func insertIntoThings(_ value: Things, at idx: Int)

    @objc(removeObjectFromThingsAtIndex:)
    @NSManaged public func removeFromThings(at idx: Int)

    @objc(insertThings:atIndexes:)
    @NSManaged public func insertIntoThings(_ values: [Things], at indexes: NSIndexSet)

    @objc(removeThingsAtIndexes:)
    @NSManaged public func removeFromThings(at indexes: NSIndexSet)

    @objc(replaceObjectInThingsAtIndex:withObject:)
    @NSManaged public func replaceThings(at idx: Int, with value: Things)

    @objc(replaceThingsAtIndexes:withThings:)
    @NSManaged public func replaceThings(at indexes: NSIndexSet, with values: [Things])

    @objc(addThingsObject:)
    @NSManaged public func addToThings(_ value: Things)

    @objc(removeThingsObject:)
    @NSManaged public func removeFromThings(_ value: Things)

    @objc(addThings:)
    @NSManaged public func addToThings(_ values: NSOrderedSet)

    @objc(removeThings:)
    @NSManaged public func removeFromThings(_ values: NSOrderedSet)

}

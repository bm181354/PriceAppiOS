//
//  Item+CoreDataProperties.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/23/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String
    @NSManaged public var shopURL: String?
    @NSManaged public var mediaURL: String
    @NSManaged public var price: Float
    @NSManaged public var id: String
    @NSManaged public var rating: String

}

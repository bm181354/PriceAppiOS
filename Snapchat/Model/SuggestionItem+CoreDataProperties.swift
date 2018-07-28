//
//  SuggestionItem+CoreDataProperties.swift
//  
//
//  Created by Riken Maharjan on 7/27/18.
//
//

import Foundation
import CoreData


extension SuggestionItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SuggestionItem> {
        return NSFetchRequest<SuggestionItem>(entityName: "SuggestionItem")
    }

    @NSManaged public var mediaURL: String
    @NSManaged public var title: String
    @NSManaged public var price: Float
    @NSManaged public var id: String

}

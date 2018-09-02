//
//  SubVCExtension.swift
//  PriceApp
//
//  Created by Biken Maharjan on 8/9/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import UIKit
import CoreData

extension SubDetailVC{
    
    //deletes item method
    func deleteAnItem(id:Int64){
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do {
            let result = try context.fetch(fetchRequest) as! [Item]
            
            for item in result {
                context.delete(item)
            }
            
            // Save Changes
            try context.save()
            
        } catch {
            // Error Handling
            // ...
        }
    }
    
}

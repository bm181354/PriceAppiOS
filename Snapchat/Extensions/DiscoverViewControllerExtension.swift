//
//  DiscoverViewControllerExtension.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/24/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation
import CoreData

extension DiscoverViewController{
    
    func fetchEverything() -> [Item]{
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        
        do{
            let result = try context.fetch(fetchRequest)
            if (result.count)>0{
                
                return (result as? [Item])!
                
            }else{
                
                return [Item]()
            }
            
        }catch{
            
            print(error)
            
        }
        
        return [Item]()
    }
    
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

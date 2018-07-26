//
//  LensViewController.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/23/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation
import CoreData

extension LensViewController{
    
    func createItemEntityFrom(dictionary: [String: Any]) -> NSManagedObject? {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        var itemEntity = Item(context: context)

       
            itemEntity.title = dictionary["title"] as? String ?? "N/A"
            itemEntity.id = dictionary["id"] as? String ?? "N/A"
            itemEntity.rating = (dictionary["rating"] as? String) ?? "N/A"
            itemEntity.mediaURL = (dictionary["mediaURL"] as? String) ?? "N/A"
        
        
        
            itemEntity.price = dictionary["msrp"] as? Float ?? 0.0
            itemEntity.shopURL = "N/A"
            
            return itemEntity
    
    }
    
    
    func updateEntity(id:String, with price: Float, with rating:String, dictionary: [String: Any]){
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
         fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do{
         let result = try context.fetch(fetchRequest)
            if (result.count)>0{
            if let resultData = result[0] as? Item{
                

                    resultData.setValue(price, forKey: "price")
                    resultData.setValue(rating, forKey: "rating")
                

            }
            }else{
              // create new entity
              _ =   self.createItemEntityFrom(dictionary: dictionary)
                
            }
            
        }catch{
            
            print(error)
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
}

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
        
        let itemEntity = Item(context: context)

       
            itemEntity.title = dictionary["title"] as? String ?? "N/A"
            itemEntity.id = dictionary["itemId"] as? Int64 ?? 0
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
    
    // for suggestionItem
    
    func createSuggestionItemEntityFrom(title: String,id:Int, price: Float, url: String) -> NSManagedObject? {
        let context = CoreDataStack.sharedInstance.persistentContainer2.viewContext
        
        let suggestonItemEntity = SuggestionItem(context: context)
        
        print(title,id)
        
        
        suggestonItemEntity.title = title
   
        suggestonItemEntity.mediaURL = url
        
        suggestonItemEntity.id = id
        
        
        
        suggestonItemEntity.price =  price
       
        
        return suggestonItemEntity
        
    }
    
    
    func deleteAllSuggestion(){
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SuggestionItem")
        let context = CoreDataStack.sharedInstance.persistentContainer2.viewContext
        
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let result = try context.fetch(fetchRequest) as! [SuggestionItem]
            
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

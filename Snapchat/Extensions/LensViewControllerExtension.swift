//
//  LensViewController.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/23/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

extension LensViewController{
    
    func update(product: String){
        APIService.shared.fetchSuggestion(product: product) { (data) in
            switch data{
            case .Success(let data):
                if let data = data {
                    
                    let jsonArray = JSON(data)
                    
                    
                    self.deleteAllSuggestion()
                    for (index,subJson):(String, JSON) in jsonArray {
                        
                        guard let title = subJson["name"].string ,let mediaURL = subJson["mediumImage"].string ,let price = subJson["msrp"].float ?? subJson["salePrice"].float , let id = subJson["itemId"].int else{
                            // do some error handling here
                            
                            print("hello")
                            return
                        }
                        
                        // delete the data
                        
                        
                        print(title)
                        //                        self.deleteAllSuggestion()
                        _ = self.createSuggestionItemEntityFrom(title: title, id: id, price: price, url: mediaURL)
                    }
                    
                    do {
                        try CoreDataStack.sharedInstance.persistentContainer2.viewContext.save()
                    } catch let error {
                        print(error)
                        
                    }
                    
                    
                    
                }else{
                    
                    print("null")
                }
                
                
            case .Error(let error):
                print (error)
            }
        }
    }
    
    func createItemEntityFrom(id:Int64, with price: Float, with rating:String, with title: String, with mediURL: String) -> NSManagedObject? {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
        let itemEntity = Item(context: context)

       
            itemEntity.title = title
            itemEntity.id = id
            itemEntity.rating = rating
            itemEntity.mediaURL = mediURL
        
        
        
            itemEntity.price = price
            itemEntity.shopURL = "N/A"
            
            return itemEntity
    
    }
    
    
    func updateEntity(id:Int64, withPrice price: Float, withRating rating:String, withTitle title: String, withMediaURL mediaURL: String){
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
         fetchRequest.predicate = NSPredicate(format: "id == %i", id)
        do{
         let result = try context.fetch(fetchRequest)
            if (result.count)>0{
            if let resultData = result[0] as? Item{
                

                    resultData.setValue(price, forKey: "price")
                    resultData.setValue(rating, forKey: "rating")
                

            }
            }else{
              // create new entity
                _ =   self.createItemEntityFrom(id: id,with: price,with: rating,with: title,with: mediaURL)
                
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
    
    /*
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
    */

    
}

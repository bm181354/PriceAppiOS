//
//  ChatViewControllerExtension.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/27/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation
import CoreData

extension ChatViewController{
    
    func fetchEverything() -> [SuggestionItem]{
        
        let context = CoreDataStack.sharedInstance.persistentContainer2.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SuggestionItem")
        
        print("fetchEverything::CHATVIEWCONTROLLER")
        do{
            let result = try context.fetch(fetchRequest)
            if (result.count)>0{
                
                return (result as? [SuggestionItem])!
                
            }else{
                
                return [SuggestionItem]()
            }
            
        }catch{
            
            print(error)
            
        }
        
        return [SuggestionItem]()
    }
    
    
    
}

//
//  NetworkManager.swift
//  PriceApp
//
//  Created by Riken Maharjan on 7/21/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation


class NetworkManager {
    
    // some kind of reauth
    
    static let shared  = NetworkManager()
    private let session = URLSession.shared
    
    private init(){}
    
    func Interface(callback:@escaping (APIResult<Data?>)->Void, url:URL){
        
        getData(url: url){
            
            (isReAuthRequired:Bool, data: Data?) in
            
            if isReAuthRequired {
                  //do reauth
                if (NetworkManager.reAuth()){
                    
                    
                }else{
                    //force logout
                   ROOT.FORCE_LOG_OUT()
                    
                }
                
                
                
            }else {
               // get the data
               // iterate
                
                
                
                callback(.Success(data))
                
            }
            
            
        }
        
        
    
    }
    
    func getData(url: URL, callback:@escaping (Bool,Data?)->Void){
        
 
    
    let url = url
    
            let task = session.dataTask(with: url) { (data, res , err) in
    
             
             // check if code is statuscode says reauth required
                if let httpResponse = res as? HTTPURLResponse {
                   
  
                        if httpResponse.statusCode == 401{
                            callback(true,nil)
                            
                        }else if httpResponse.statusCode == 200 || httpResponse.statusCode == 201{
                            
                            

                            DispatchQueue.main.async {
                                 callback(false, data)
                            }
                            
                           
                            
                        }
                
                }
                
                
    
            }
    
            task.resume()
    
    }
    
    class func reAuth() -> Bool{
        
        // if app had jwt then implement storing 
        return true
        
    }
    
    
}

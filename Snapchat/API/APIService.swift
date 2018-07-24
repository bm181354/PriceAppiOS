//
//  APIService.swift
//  Snapchat
//
//  Created by Biken Maharjan on 7/21/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation


protocol APIServiceProtocol {
    func fetchProduct(code:String, callback: @escaping (APIResult<Data?>)->Void)
    func fetchSuggestion()
    
}

enum APIResult<T>{
    
    case Success(T)
    case Error(String)
    
}



class APIService{
    
    fileprivate init(){}
    static var shared = APIService()


}


extension APIService: APIServiceProtocol{
    
    
    func fetchProduct(code: String, callback:@escaping (APIResult<Data?>)->Void) {
      let queryURL =  URL(string: PRODUCT_QUERY_URL+"035000521019") //replace with the code
        
     
     
        NetworkManager.shared.Interface(callback: callback, url: queryURL!)
        
  
        
    }
    
    func fetchSuggestion() {
        print(2)
    }
}





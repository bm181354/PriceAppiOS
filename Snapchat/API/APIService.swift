//
//  APIService.swift
//  Snapchat
//
//  Created by Biken Maharjan on 7/21/18.
//  Copyright © 2018 RayWenderlich.com. All rights reserved.
//

import Foundation


protocol APIServiceProtocol {
    func fetchProduct(code:String)
    func fetchSuggestion()
    
}



class APIService: APIServiceProtocol{


}

extension APIService{
    
    
    func fetchProduct(code: String) {
        print(2)
    }
    func fetchSuggestion() {
        print(2)
    }
}


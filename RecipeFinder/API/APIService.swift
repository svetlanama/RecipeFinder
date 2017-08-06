//
//  ApiService.swift
//  RecipeFinder
//
//  Created by Svitlana Moiseyenko on 8/6/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    static let sharedInstance = APIService()
    
    private init() {}
    
    func getRecepies(searchText: String, comletion: @escaping (_ result: [Recipe]) -> Void) {
        let url = "\(Constants.API.URL)?q=\(searchText)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                if let json = response.result.value {
                    let res = ParserResponseUtils.parseSearchResponse(json).prefix(Constants.recipeLimit)
                    comletion(Array(res))
                } else {
                    comletion([])
                }
        }
    }
}

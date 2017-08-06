//
//  ParseResponseUtils.swift
//  RecipeFinder
//
//  Created by Svitlana Moiseyenko on 8/6/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

final class ParserResponseUtils {
 
    class func parseSearchResponse(_ json: Any) -> [Recipe] {
        
        var recipes = [Recipe]()
        if let data = json as? [String: Any],
            let results = data["results"] as? [Any] {
            
            for json in results {
                if let value = json as? [String : Any] {
                    recipes.append(Recipe(dic: value))
                }
            }
       }
        
       return recipes
    }
}

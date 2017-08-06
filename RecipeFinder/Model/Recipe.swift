//
//  Recipe.swift
//  RecipeFinder
//
//  Created by Svitlana Moiseyenko on 8/6/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation

final class Recipe {
    
    var title: String = ""
    
    init(dic: [String: Any]) {
        title = dic["title"] as? String ?? ""
        
        // Data like href, ingredients, thumbnail are not valuable now
    }
}

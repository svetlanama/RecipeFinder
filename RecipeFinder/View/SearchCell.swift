//
//  SearchCell.swift
//  RecipeFinder
//
//  Created by Svitlana Moiseyenko on 8/6/17.
//  Copyright © 2017 Svitlana Moiseyenko. All rights reserved.
//

import Foundation
import UIKit

class SearchCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(forRecipe recipe: Recipe) {
       textLabel?.text = recipe.title
    }
}

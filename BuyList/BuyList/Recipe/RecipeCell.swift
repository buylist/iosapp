//
//  RecipeCell.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDeleteButton: UIButton!
    @IBOutlet weak var recipeEditButton: UIButton!
    
    var index: Int = 0
    var onDeletePressed: ((Int) -> ())?
    var onEditPressed: ((Int) -> ())?
    
    @IBAction func onDeletePressed(_ sender: Any) {
        onDeletePressed?(index)
    }
    
    @IBAction func onEditPressed(_ sender: Any) {
        onEditPressed?(index)
    }
}

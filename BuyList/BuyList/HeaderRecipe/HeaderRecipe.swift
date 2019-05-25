//
//  HeaderRecipeInfo.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 23.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class HeaderRecipe: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var createButton: UIButton!
    
    var index: Int = 0
    var onHeaderCreatePressed: ((Int) -> ())?
    
    @IBAction func createPressed(_ sender: Any) {
        onHeaderCreatePressed?(index)
    }
}

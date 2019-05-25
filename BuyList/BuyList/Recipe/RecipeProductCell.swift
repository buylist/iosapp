//
//  RecipeInformationCell.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeProductCell: UITableViewCell {

    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productMass: UILabel!
    @IBOutlet weak var productButtonView: UIButton!
    @IBOutlet weak var productDeleteButton: UIButton!
    @IBOutlet weak var probuctEditButton: UIButton!
    
    
    var index: Int = 0
    var onViewPressed: ((Int) -> ())?
    var onDeletePressed: ((Int) -> ())?
    var onEditPressed: ((Int) -> ())?
    
    @IBAction func onViewPressed(_ sender: Any) {
        onViewPressed?(index)
    }
    
    @IBAction func onDeletePressed(_ sender: Any) {
        onDeletePressed?(index)
    }
    
    @IBAction func onEditPressed(_ sender: Any) {
        onEditPressed?(index)
    }
}

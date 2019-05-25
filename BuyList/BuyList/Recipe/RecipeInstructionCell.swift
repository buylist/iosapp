//
//  RecipeCell.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeInstructionCell: UITableViewCell {
    
    @IBOutlet weak var instructionNumber: UILabel!
    @IBOutlet weak var instructionText: UILabel!
    @IBOutlet weak var instructionEditButton: UIButton!
    @IBOutlet weak var instructionDeleteButton: UIButton!
    
    var index: Int = 0
    var onEditPressed: ((Int) -> ())?
    var onDeletePressed: ((Int) -> ())?
    
    @IBAction func onEditPressed(_ sender: Any) {
        onEditPressed?(index)
    }
    
    @IBAction func onDeletePressed(_ sender: Any) {
        onDeletePressed?(index)
    }
}

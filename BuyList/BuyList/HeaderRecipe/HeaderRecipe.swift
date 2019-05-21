//
//  HeaderRecipe.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class HeaderRecipe: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var headerCreateButton: UIButton!
    @IBOutlet weak var headerCancelButtin: UIButton!
    
    
    var index: Int = 0
    var onHeaderCreatePressed: ((Int) -> ())?
    var onHeaderCencelPressed: ((Int) -> ())?
    
    @IBAction func createPressed(_ sender: Any) {
        onHeaderCreatePressed?(index)
    }
    
    @IBAction func cancelButton(_ semder: Any) {
        onHeaderCencelPressed?(index)
    }
}

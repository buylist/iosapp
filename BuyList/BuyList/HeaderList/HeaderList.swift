//
//  Header.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class HeaderList: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var headerButtonOpenCell: UIButton!
    
    var index: Int = 0
    var onHeaderCreatePressed: ((Int) -> ())?
    var onHeaderOpenCellPressed: ((Int) -> ())?
    
    @IBAction func createPressed(_ sender: Any) {
        onHeaderCreatePressed?(index)
    }
    @IBAction func onHeaderOpenCellPressed(_ sender: Any) {
        onHeaderOpenCellPressed?(index)
    }
}

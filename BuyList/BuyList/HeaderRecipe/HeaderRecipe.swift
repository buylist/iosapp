//
//  HeaderRecipeInfo.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 23.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

protocol HeaderRecipeDelegate {
    func toggleSection(_ header: HeaderRecipe, section: Int)
}

class HeaderRecipe: UITableViewHeaderFooterView {
    
    var delegate: HeaderRecipeDelegate?
    
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var createButton: UIButton!
    
    var index: Int = 0
    var onHeaderCreatePressed: ((Int) -> ())?
    
    @IBAction func createPressed(_ sender: Any) {
        onHeaderCreatePressed?(index)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HeaderRecipe.tapHeader(_:))))
    }
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? HeaderRecipe else {
            return
        }
        delegate?.toggleSection(self, section: cell.index)
    }
}

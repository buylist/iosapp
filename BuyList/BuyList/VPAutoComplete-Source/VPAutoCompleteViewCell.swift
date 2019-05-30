//
//  VPAutoCompleteViewCell.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 28.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class VPAutoCompleteViewCell: UITableViewCell {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var viewCircle: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

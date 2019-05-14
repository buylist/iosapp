//
//  ListCell.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 14.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var index: Int = 0
    var onDeletePressed: ((Int) -> ())?
    var onCreatePressed: ((Int) -> ())?
    var onEditPressed: ((Int) -> ())?
    
    @IBAction func deletePressed(_ sender: Any) {
        onDeletePressed?(index)
    }
    
    @IBAction func createPressed(_ sender: Any) {
        onCreatePressed?(index)
    }
    
    @IBAction func editPressed(_ sender: Any) {
        onEditPressed?(index)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

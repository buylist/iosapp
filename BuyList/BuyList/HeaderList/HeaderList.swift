//
//  Header.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 15.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

protocol HeaderListDelegate {
    func toggleSection(_ header: HeaderList, section: Int)
}

class HeaderList: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var headerImage: UIImageView!
    
    var delegate: HeaderListDelegate?
    
    var index: Int = 0
    var onHeaderCreatePressed: ((Int) -> ())?
    var onHeaderOpenCellPressed: ((Int) -> ())?
    
    @IBAction func createPressed(_ sender: Any) {
        onHeaderCreatePressed?(index)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HeaderList.tapHeader(_:))))
    }

    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? HeaderList else {
            return
        }
        delegate?.toggleSection(self, section: cell.index)
    }
}

class FooterList: UITableViewHeaderFooterView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

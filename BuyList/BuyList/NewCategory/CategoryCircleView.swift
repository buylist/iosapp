//
//  CategoryCircleView.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 30.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class CategoryCircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.width / 2
    }
}

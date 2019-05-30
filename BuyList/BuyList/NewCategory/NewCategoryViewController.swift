//
//  NewCategoryViewController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 30.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class NewCategoryViewCointroller: UIViewController {
    
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var categoryProduct: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryTextField.placeholder = " Введите название категории"
        addDropDown()
    }
    
    func addDropDown() {
        
        let dropDownTop = VPAutoComplete()
        dropDownTop.dataSource = ["Продукты", "Товары для дома", "Красота и здоровье", "Детям и мамам", "Авто Мото", "Зоотовары"]
        dropDownTop.viewColor = [UIColor.blue, UIColor.green, UIColor.red, UIColor.orange, UIColor.yellow, UIColor.purple]
        dropDownTop.onTextField = categoryTextField
        dropDownTop.onView = self.view
        dropDownTop.show { (str, index) in
            print("string : \(str) and Index : \(index)")
            self.categoryTextField.text = str
        }
    }
    
    @IBAction func cancelButtonBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

//
//  RecipeInformationController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeInformationController: UITableViewController {
    
    var ProductNameArray = ["Бананы", "Ананасы", "Яблоки"]
    var ProductMassArray = ["400г", "500г", "250г"]
    var InstructArray = ["Купить.", "Помыть.", "Скушать."]
    
    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderRecipe", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipe")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
        return ProductNameArray.count
        } else if section == 2 {
            return InstructArray.count
        } else if section == 0 {
            return 0
        }
        
        return section
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderRecipe") as! HeaderRecipe
        if section == 0 {
        headerView.headerName.text = "Какой-то рецепт"
        } else if section == 1 {
            headerView.headerName.text = "Ингредиенты"
            headerView.headerCancelButton.isHidden = true
            headerView.headerCreateButton.isHidden = true
        } else if section == 2 {
            headerView.headerName.text = "Инструкция"
            headerView.headerCancelButton.isHidden = true
            headerView.headerCreateButton.isHidden = true
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
        
        cell.productName.text = ProductNameArray[indexPath.row]
        cell.productMass.text = ProductMassArray[indexPath.row]

        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell") as! RecipeInstructionCell
            let indexNumber = indexPath.row + 1
            
            cell.instructionText.text = InstructArray[indexPath.row]
            cell.instructionNumber.text = "\(indexNumber)."

            return cell
        }
        
        return cell
    }
}

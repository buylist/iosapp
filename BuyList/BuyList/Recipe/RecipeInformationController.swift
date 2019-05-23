//
//  RecipeInformationController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeInformationController: UITableViewController {
    
    @IBOutlet weak var lableRecipeName: UILabel!
    @IBOutlet weak var EditRecipe: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var nameLable = "Название"
    
    var ProductNameArray = ["Бананы", "Ананасы", "Яблоки"]
    var ProductMassArray = ["400г", "500г", "250г"]
    var InstructArray = ["Купить.", "Помыть.", "Скушать."]
    
    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderRecipeInfo", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipeInfo")
        
//        lableRecipeName.text = nameLable
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
        return ProductNameArray.count
        } else if section == 1 {
            return InstructArray.count
        }
        
        return section
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderRecipeInfo") as! HeaderRecipeInfo
        if section == 0 {
            headerView.headerName.text = "Ингредиенты"
            headerView.headerButton.isHidden = true
        } else if section == 1 {
            headerView.headerName.text = "Инструкция"
            headerView.headerButton.isHidden = true
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
        
        cell.productName.text = ProductNameArray[indexPath.row]
        cell.productMass.text = ProductMassArray[indexPath.row]

        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell") as! RecipeInstructionCell
            let indexNumber = indexPath.row + 1
            
            cell.instructionText.text = InstructArray[indexPath.row]
            cell.instructionNumber.text = "\(indexNumber)."

            return cell
        }
        
        return cell
    }
    
    @IBAction func cencelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Проверяем иденфикацию перехода, чтобы убедиться, что это нужный элемент
//        if segue.identifier == "lableName" {
//            // Получаем ссылку контроллера, с которого осуществлен переход
//            let recipeController = segue.source as! RecipeController
//            // Получаем игндекс выделленой ячейки
//            if let indexPath = recipeController.tableView.indexPathForSelectedRow {
//                let name = recipeController.RecipeName[indexPath.row]
//                lableRecipeName.text = name
//                tableView.reloadData()
//            }
//        }
//        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
//    }
}

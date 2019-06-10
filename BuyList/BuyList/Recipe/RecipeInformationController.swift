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
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cencelView: UIView!
    
    var nameLable: String!
    var textFieldName: UITextField?
    var textFieldMass: UITextField?
    
    var recipe = sectionsDataRecipe
    var indexView = 0
    
    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderRecipe", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipe")
        
        lableRecipeName.text = nameLable
        cencelView.backgroundColor = UIColor(patternImage: UIImage(named: "Back")!)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return recipe.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipe[section].collapsed ? 0 : recipe[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderRecipe") as! HeaderRecipe
        // section1
        if section == 0 {
            headerView.headerName.text = recipe[section].name
            
            headerView.onHeaderCreatePressed = {
                [weak self] index in
            
                let alertController = UIAlertController(title: "Добавить новый ингредиент?", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                alertController.addTextField(configurationHandler: newTextFieldName)
                alertController.addTextField(configurationHandler: newTextFieldMass)
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
            
                self?.present(alertController, animated: true)
            }
            
            func newTextFieldName(textField: UITextField!) {
                textFieldName = textField
                textFieldName?.placeholder = "Новый ингредиент"
            }
            
            func newTextFieldMass(textField: UITextField!) {
                textFieldMass = textField
                textFieldMass?.placeholder = "Кол-во"
            }
            
            func newOkHandler(alert: UIAlertAction!) {
                if !(recipe[section].name.contains(textFieldName!.text!)) && textFieldName!.text! != "" {
                    recipe[section].items.append(Item.init(name: textFieldName!.text!, count: textFieldMass!.text!, okView: false))
                    tableView.reloadData()
                } else if  textFieldName!.text! == "" {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                } else {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Ингредиент с таким название уже существует.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                }
            }
            
        // section2
        } else if section == 1 {
            headerView.headerName.text = recipe[section].name
            
            headerView.onHeaderCreatePressed = {
                [weak self] index in
                
                let alertController = UIAlertController(title: "Добавить новую инструкцию?", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                alertController.addTextField(configurationHandler: newTextFieldName)
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                self?.present(alertController, animated: true)
            }
            
            func newTextFieldName(textField: UITextField!) {
                textFieldName = textField
                textFieldName?.placeholder = "Новая инструкция"
            }
            
            func newOkHandler(alert: UIAlertAction!) {
                if textFieldName!.text! != "" {
                    recipe[section].items.append(Item.init(name: textFieldName!.text!, count: "", okView: false))
                    tableView.reloadData()
                } else {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Пусто.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                }
            }
        }
        
        headerView.index = section
        headerView.delegate = self
        
        return headerView
    }
        
        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        var item: Item = recipe[indexPath.section].items[indexPath.row]
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as? RecipeProductCell ?? RecipeProductCell(style: .default, reuseIdentifier: "RecipeProductCell")
            let cellProduct = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
            
            cellProduct.productName.text = item.name
            cellProduct.productMass.text = item.count
            
            cellProduct.productView.layer.borderWidth = 1
            cellProduct.productView.layer.borderColor = UIColor.red.cgColor
            cellProduct.productView.backgroundColor = UIColor.white
            
            cellProduct.onViewPressed = {
                [weak self] index in
                if !item.okView {
                    cellProduct.productView.backgroundColor = UIColor.red
                    item.okView = true
                } else if item.okView {
                    cellProduct.productView.backgroundColor = UIColor.white
                    item.okView = false
                }
            }
            
            return cellProduct
            
            
            } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell", for: indexPath) as? RecipeInstructionCell ?? RecipeProductCell(style: .default, reuseIdentifier: "RecipeProductCell")
            let cellInstruction = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell") as! RecipeInstructionCell
            let indexNumber = indexPath.row + 1
            
            cellInstruction.instructionText.text = item.name
            cellInstruction.instructionNumber.text = "\(indexNumber)."
            
            return cellInstruction
        }
        return cell
    }
    
    
    @IBAction func cencelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        if indexPath.section == 0 {
        return UISwipeActionsConfiguration(actions: [delete, edit])
        } else {
            return UISwipeActionsConfiguration(actions: [delete])
        }
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: nil) {
            (action, view, complection) in
            self.recipe[indexPath.section].items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
        action.backgroundColor = UIColor(patternImage: UIImage(named: "Удалить")!)
        
        return action
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        
        var item = recipe[indexPath.section].items[indexPath.row]
        
        let action = UIContextualAction(style: .normal, title: nil) {
            (action, view, complection) in
            
            let alertController = UIAlertController(title: "Изменить название Ингредиента?", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addTextField(configurationHandler: editTextFieldName)
            alertController.addTextField(configurationHandler: editTextFieldMass)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
        }
        
        func editTextFieldName(textField: UITextField!) {
            textFieldName = textField
            textFieldName?.placeholder = recipe[indexPath.section].items[indexPath.row].name
        }
        
        func editTextFieldMass(textField: UITextField!) {
            textFieldMass = textField
            textFieldMass?.placeholder = recipe[indexPath.section].items[indexPath.row].count
        }
        
        func editOkHandler(alert: UIAlertAction!) {
            if (!item.name.contains(textFieldName!.text!) || item.name == textFieldName!.text!) && textFieldName!.text! != "" {
                recipe[indexPath.section].items[indexPath.row].name = textFieldName!.text!
                recipe[indexPath.section].items[indexPath.row].count = textFieldMass!.text!
                tableView.reloadData()
            } else if textFieldName!.text! == "" {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Ингредиент с таким название уже существует.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
        
        action.backgroundColor = UIColor(patternImage: UIImage(named: "Ред")!)
        
        return action
    }
}

extension RecipeInformationController: HeaderRecipeDelegate {
    func toggleSection(_ header: HeaderRecipe, section: Int) {
        
        let collapsed = !recipe[section].collapsed
        
        recipe[section].collapsed = collapsed
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}

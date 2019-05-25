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
    @IBOutlet weak var editRecipeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var indexIsHidden: Int = 0
    
    var nameLable: String!
    var textFieldName: UITextField?
    var textFieldMass: UITextField?
    
    var ProductNameArray = ["Бананы", "Ананасы", "Яблоки"]
    var ProductMassArray = ["400г", "500г", "250г"]
    var InstructArray = ["Купить.", "Помыть.", "Скушать."]
    
    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderRecipe", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipe")
        
        lableRecipeName.text = nameLable
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderRecipe") as! HeaderRecipe
        
        if indexIsHidden == 0 {
            headerView.createButton.isHidden = true
        } else if indexIsHidden == 1 {
            headerView.createButton.isHidden = false
        }
        
        // section1
        if section == 0 {
            headerView.headerName.text = "Ингредиенты"
            
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
                if !(ProductNameArray.contains(textFieldName!.text!)) && textFieldName!.text! != "" {
                    ProductNameArray.append(textFieldName!.text!)
                    ProductMassArray.append(textFieldMass!.text!)
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
            headerView.headerName.text = "Инструкция"
            
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
                if !(InstructArray.contains(textFieldName!.text!)) && textFieldName!.text! != "" {
                    InstructArray.append(textFieldName!.text!)
                    tableView.reloadData()
                } else if  textFieldName!.text! == "" {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                } else {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Инструкция с таким название уже существует.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                }
            }
        }
        
        return headerView
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
            let cellProduct = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
            cellProduct.productName.text = ProductNameArray[indexPath.row]
            cellProduct.productMass.text = ProductMassArray[indexPath.row]
            cellProduct.productView.backgroundColor = UIColor.red
            
            if indexIsHidden == 0 {
                cellProduct.probuctEditButton.isHidden = true
                cellProduct.productDeleteButton.isHidden = true
            } else if indexIsHidden == 1 {
                cellProduct.probuctEditButton.isHidden = false
                cellProduct.productDeleteButton.isHidden = false
            }
            
            cellProduct.onViewPressed = {
                [weak self] index in
                if cellProduct.productView.backgroundColor == UIColor.red {
                    cellProduct.productView.backgroundColor = UIColor.green
                    cellProduct.productButtonView.setTitle("ok", for: .normal)
                } else if cellProduct.productView.backgroundColor == UIColor.green {
                    cellProduct.productView.backgroundColor = UIColor.red
                    cellProduct.productButtonView.setTitle("", for: .normal)
                }
            }
            
            cellProduct.onDeletePressed = {
                [weak self] index in
                self?.ProductNameArray.remove(at: indexPath.row)
                self?.ProductMassArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
            }
            
            cellProduct.onEditPressed = {
                [weak self] index in
                
                let alertController = UIAlertController(title: "Изменить название Ингредиент?", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                alertController.addTextField(configurationHandler: editTextFieldName)
                alertController.addTextField(configurationHandler: editTextFieldMass)
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                self?.present(alertController, animated: true)
            }
            
            func editTextFieldName(textField: UITextField!) {
                textFieldName = textField
                textFieldName?.placeholder = ProductNameArray[indexPath.row]
            }
            
            func editTextFieldMass(textField: UITextField!) {
                textFieldMass = textField
                textFieldMass?.placeholder = ProductMassArray[indexPath.row]
            }
            
            func editOkHandler(alert: UIAlertAction!) {
                if (!(ProductNameArray.contains(textFieldName!.text!)) || ProductNameArray[indexPath.row] == textFieldName!.text!) && textFieldName!.text! != "" {
                    ProductNameArray[indexPath.row] = textFieldName!.text!
                    ProductMassArray[indexPath.row] = textFieldMass!.text!
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
            
            return cellProduct
            
            
            } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell", for: indexPath) as! RecipeInstructionCell
            let cellInstruction = tableView.dequeueReusableCell(withIdentifier: "RecipeInstructionCell") as! RecipeInstructionCell
            let indexNumber = indexPath.row + 1
            
            cellInstruction.instructionText.text = InstructArray[indexPath.row]
            cellInstruction.instructionNumber.text = "\(indexNumber)."
            
            if indexIsHidden == 0 {
                cellInstruction.instructionEditButton.isHidden = true
                cellInstruction.instructionDeleteButton.isHidden = true
            } else if indexIsHidden == 1 {
                cellInstruction.instructionEditButton.isHidden = false
                cellInstruction.instructionDeleteButton.isHidden = false
            }
            
            cellInstruction.onDeletePressed = {
                [weak self] index in
                self?.InstructArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.reloadData()
                print(index)
            }
            
            cellInstruction.onEditPressed = {
                [weak self] index in
                
                let alertController = UIAlertController(title: "Изменить название Инструкции?", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
                let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
                alertController.addTextField(configurationHandler: editTextField)
                alertController.addAction(okAction)
                alertController.addAction(cancelAction)
                
                self?.present(alertController, animated: true)
            }
            
            func editTextField(textField: UITextField!) {
                textFieldName = textField
                textFieldName?.placeholder = InstructArray[indexPath.row]
            }
            
            func editOkHandler(alert: UIAlertAction!) {
                if (!(InstructArray.contains(textFieldName!.text!)) || InstructArray[indexPath.row] == textFieldName!.text!) && textFieldName!.text! != "" {
                    InstructArray[indexPath.row] = textFieldName!.text!
                    tableView.reloadData()
                } else if textFieldName!.text! == "" {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                } else {
                    let alertController = UIAlertController(title: "Ошибка!", message:  "Инструкция с таким название уже существует.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true)
                }
            }
            return cellInstruction
        }
        return cell
    }
    
    
    @IBAction func cencelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        
        if editRecipeButton.titleLabel?.text == "Ред." {
            editRecipeButton.setTitle("Отмена", for: .normal)
            editRecipeButton.setTitleColor(UIColor.red, for: .normal)
            indexIsHidden = 1
        } else if editRecipeButton.titleLabel?.text == "Отмена"{
            editRecipeButton.setTitle("Ред.", for: .normal)
            editRecipeButton.setTitleColor(UIColor.blue, for: .normal)
            indexIsHidden = 0
        }
        tableView.reloadData()
    }
}

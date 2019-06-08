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
    
    var nameLable: String!
    var textFieldName: UITextField?
    var textFieldMass: UITextField?
    
    var sections = sectionsDataRecipe
    
    var ProductNameArray = ["Бананы", "Ананасы", "Яблоки"]
    var ProductMassArray = ["400г", "500г", "250г"]
    var InstructArray = ["Купить.", "Помыть.", "Скушать."]
    
    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderRecipe", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipe")
        
        lableRecipeName.text = nameLable
    }
}
    
    extension RecipeInformationController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].collapsed ? 0 : sections[section].items.count
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
            headerView.headerName.text = sections[section].name
            
        // section2
        } else if section == 1 {
            headerView.headerName.text = sections[section].name
        }
        
        return headerView
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as? RecipeProductCell ?? RecipeProductCell(style: .default, reuseIdentifier: "RecipeProductCell")
            let cellProduct = tableView.dequeueReusableCell(withIdentifier: "RecipeProductCell", for: indexPath) as! RecipeProductCell
            
            cellProduct.productName.text = item.name
            cellProduct.productMass.text = item.count
            
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
}

extension RecipeInformationController: HeaderRecipeDelegate {
    func toggleSection(_ header: HeaderRecipe, section: Int) {
        
        let collapsed = !sections[section].collapsed
        
        sections[section].collapsed = collapsed
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
}


//import UIKit

//class ListController: UITableViewController {
//
//    var listTextField: UITextField?
//
//    var sections = sectionsDataRecipe
//    var listSectionImages = [0: #imageLiteral(resourceName: "списки"), 1: #imageLiteral(resourceName: "шаблоны"), 2: #imageLiteral(resourceName: "рецепты")]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let headerNib = UINib.init(nibName: "HeaderList", bundle: Bundle.main)
//        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderList")
//
//        let footerNib = UINib.init(nibName: "FooterList", bundle: Bundle.main)
//        tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "FooterList")
//    }
//}

//extension ListController {
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].collapsed ? 0 : sections[section].items.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: ListCell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell ??
//            ListCell(style: .default, reuseIdentifier: "ListCell")
//
//        let item: Item = sections[indexPath.section].items[indexPath.row]
//
//        cell.listName.text = item.name
//
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderList") as? HeaderList ?? HeaderList(reuseIdentifier: "HeaderList")
//
//        headerView.headerName.text = sections[section].name
//        headerView.headerImage.image = listSectionImages[section]
//
//        headerView.onHeaderCreatePressed = {
//            [weak self] index in
//
//            let alertController = UIAlertController(title: "Добавить новый список?", message: nil, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
//            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//            alertController.addTextField(configurationHandler: newTextField)
//            alertController.addAction(okAction)
//            alertController.addAction(cancelAction)
//
//            self?.present(alertController, animated: true)
//        }
//
//        func newTextField(textField: UITextField!) {
//            listTextField = textField
//            listTextField?.placeholder = "Новый список"
//        }
//
//        func newOkHandler(alert: UIAlertAction!) {
//            sections[section].items.insert(Item.init(name: listTextField!.text!), at: 0)
//            tableView.reloadData()
//        }
//
//        headerView.index = section
//        headerView.delegate = self
//
//        return headerView
//    }
//
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterList") as! FooterList
//
//        return footerView
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 120
//    }
//
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        let collapsed = !sections[section].collapsed
//        if collapsed == true {
//            return 28
//        } else {
//            return 2
//        }
//    }
//
//}
//
//extension ListController: HeaderListDelegate {
//
//    func toggleSection(_ header: HeaderList, section: Int) {
//        let collapsed = !sections[section].collapsed
//
//        sections[section].collapsed = collapsed
//
//        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
//    }
//
//}


//cellProduct.onDeletePressed = {
//    [weak self] index in
//    self?.ProductNameArray.remove(at: indexPath.row)
//    self?.ProductMassArray.remove(at: indexPath.row)
//    tableView.deleteRows(at: [indexPath], with: .fade)
//    tableView.reloadData()
//}
//
//cellProduct.onEditPressed = {
//    [weak self] index in
//
//    let alertController = UIAlertController(title: "Изменить название Ингредиент?", message: nil, preferredStyle: .alert)
//    let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
//    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//    alertController.addTextField(configurationHandler: editTextFieldName)
//    alertController.addTextField(configurationHandler: editTextFieldMass)
//    alertController.addAction(okAction)
//    alertController.addAction(cancelAction)
//
//    self?.present(alertController, animated: true)
//}
//
//func editTextFieldName(textField: UITextField!) {
//    textFieldName = textField
//    textFieldName?.placeholder = ProductNameArray[indexPath.row]
//}
//
//func editTextFieldMass(textField: UITextField!) {
//    textFieldMass = textField
//    textFieldMass?.placeholder = ProductMassArray[indexPath.row]
//}
//
//func editOkHandler(alert: UIAlertAction!) {
//    if (!(ProductNameArray.contains(textFieldName!.text!)) || ProductNameArray[indexPath.row] == textFieldName!.text!) && textFieldName!.text! != "" {
//        ProductNameArray[indexPath.row] = textFieldName!.text!
//        ProductMassArray[indexPath.row] = textFieldMass!.text!
//        tableView.reloadData()
//    } else if textFieldName!.text! == "" {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    } else {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Ингредиент с таким название уже существует.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    }
//}
//
//cellInstruction.onDeletePressed = {
//    [weak self] index in
//    self?.InstructArray.remove(at: indexPath.row)
//    tableView.deleteRows(at: [indexPath], with: .fade)
//    tableView.reloadData()
//    print(index)
//}
//
//cellInstruction.onEditPressed = {
//    [weak self] index in
//
//    let alertController = UIAlertController(title: "Изменить название Инструкции?", message: nil, preferredStyle: .alert)
//    let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
//    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//    alertController.addTextField(configurationHandler: editTextField)
//    alertController.addAction(okAction)
//    alertController.addAction(cancelAction)
//
//    self?.present(alertController, animated: true)
//}
//
//func editTextField(textField: UITextField!) {
//    textFieldName = textField
//    textFieldName?.placeholder = InstructArray[indexPath.row]
//}
//
//func editOkHandler(alert: UIAlertAction!) {
//    if (!(InstructArray.contains(textFieldName!.text!)) || InstructArray[indexPath.row] == textFieldName!.text!) && textFieldName!.text! != "" {
//        InstructArray[indexPath.row] = textFieldName!.text!
//        tableView.reloadData()
//    } else if textFieldName!.text! == "" {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    } else {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Инструкция с таким название уже существует.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    }
//}

//headerView.onHeaderCreatePressed = {
//    [weak self] index in
//
//    let alertController = UIAlertController(title: "Добавить новый ингредиент?", message: nil, preferredStyle: .alert)
//    let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
//    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//    alertController.addTextField(configurationHandler: newTextFieldName)
//    alertController.addTextField(configurationHandler: newTextFieldMass)
//    alertController.addAction(okAction)
//    alertController.addAction(cancelAction)
//
//    self?.present(alertController, animated: true)
//}
//
//func newTextFieldName(textField: UITextField!) {
//    textFieldName = textField
//    textFieldName?.placeholder = "Новый ингредиент"
//}
//
//func newTextFieldMass(textField: UITextField!) {
//    textFieldMass = textField
//    textFieldMass?.placeholder = "Кол-во"
//}
//
//func newOkHandler(alert: UIAlertAction!) {
//    if !(ProductNameArray.contains(textFieldName!.text!)) && textFieldName!.text! != "" {
//        ProductNameArray.append(textFieldName!.text!)
//        ProductMassArray.append(textFieldMass!.text!)
//        tableView.reloadData()
//    } else if  textFieldName!.text! == "" {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    } else {
//        let alertController = UIAlertController(title: "Ошибка!", message:  "Ингредиент с таким название уже существует.", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true)
//    }
//}

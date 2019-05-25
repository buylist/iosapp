//
//  ViewController.swift
//  BuyList
//
//  Created by Boris Botov on 13.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class ListController: UITableViewController {
    
    var listTextField: UITextField?
    
    var ListSectionArray = [0: " Список продуктов", 1: "Список шаблонов", 2: "Список рецептов"]
    var ListArray = [0: ["Список1", "Список2", "Список3"], 1: ["Шаблон1", "Шаблон2", "Шаблон3"], 2: ["Рецепт1", "Рецепт2", "Рецепт3"]]

    override func viewDidLoad() {
        
        let headerNib = UINib.init(nibName: "HeaderList", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderList")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (ListArray[section]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderList") as! HeaderList
        
        headerView.headerName.text = ListSectionArray[section]
        
        headerView.onHeaderCreatePressed = {
            [weak self] index in
            
            let alertController = UIAlertController(title: "Добавить новый список?", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addTextField(configurationHandler: newTextField)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self?.present(alertController, animated: true)
        }
        
        func newTextField(textField: UITextField!) {
            listTextField = textField
            listTextField?.placeholder = "Новый список"
        }
        
        func newOkHandler(alert: UIAlertAction!) {
            if !(ListArray[section]?.contains(listTextField!.text!))! && listTextField!.text! != "" {
                ListArray[section]?.append(listTextField!.text!)
                tableView.reloadData()
            } else if  listTextField!.text! == "" {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Список с таким название уже существует.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }

        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderList") as! HeaderList
        
        var listArray = ListArray[indexPath.section]?[indexPath.row]
        
        cell.listName.text = listArray
        
        cell.onDeletePressed = {
            [weak self] index in
            self?.ListArray[indexPath.section]?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        cell.onEditPressed = {
            [weak self] index in

            let alertController = UIAlertController(title: "Изменить название списка?", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addTextField(configurationHandler: editTextField)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            self?.present(alertController, animated: true)
        }

        func editTextField(textField: UITextField!) {
            listTextField = textField
            listTextField?.placeholder = listArray
        }

        func editOkHandler(alert: UIAlertAction!) {
            if (!(ListArray[indexPath.section]?.contains(listTextField!.text!))! || ListArray[indexPath.section]?[indexPath.row] == listTextField!.text!) && listTextField!.text! != "" {
                ListArray[indexPath.section]?[indexPath.row] = listTextField!.text!
                tableView.reloadData()
            } else if listTextField!.text! == "" {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Список с таким название уже существует.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "recipeArray" {
            if let recipeController = segue.destination as? RecipeController {
//                let indexPath = tableView.indexPathForSelectedRow
                recipeController.RecipeName = ListArray[2]!
            }
        }
    }
}

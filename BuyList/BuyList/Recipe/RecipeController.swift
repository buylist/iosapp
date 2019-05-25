//
//  RecipeController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeController: UITableViewController {
    
    var recipeTextField: UITextField?
    
    var RecipeName = ["Рецепттт1", "Рецепттт2", "Рецепттт3"]
    
    override func viewDidLoad() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RecipeName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        cell.recipeName.text = RecipeName[indexPath.row]
        
        cell.onDeletePressed = {
            [weak self] index in
            self?.RecipeName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            print(index)
        }
        
        cell.onEditPressed = {
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
            recipeTextField = textField
            recipeTextField?.placeholder = RecipeName[indexPath.row]
        }
        
        func editOkHandler(alert: UIAlertAction!) {
            if (!(RecipeName.contains(recipeTextField!.text!)) || RecipeName[indexPath.row] == recipeTextField!.text!) && recipeTextField!.text! != "" {
                RecipeName[indexPath.row] = recipeTextField!.text!
                tableView.reloadData()
            } else if recipeTextField!.text! == "" {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            } else {
                let alertController = UIAlertController(title: "Ошибка!", message:  "Репецт с таким название уже существует.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
        
        return cell
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Добавить новый Репепт?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: newTextField)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func newTextField(textField: UITextField!) {
        recipeTextField = textField
        recipeTextField?.placeholder = "Новый рецепт"
    }
    
    func newOkHandler(alert: UIAlertAction!) {
        if !(RecipeName.contains(recipeTextField!.text!)) && recipeTextField!.text! != "" {
            RecipeName.append(recipeTextField!.text!)
            tableView.reloadData()
        } else if  recipeTextField!.text! == "" {
            let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "Ошибка!", message:  "Репепт с таким название уже существует.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "lableName" {
            
            if let recipeControllerInfo = segue.destination as? RecipeInformationController {
                let indexPath = tableView.indexPathForSelectedRow
                let name = RecipeName[indexPath!.row]
                recipeControllerInfo.nameLable = name
            }
        }
    }
}

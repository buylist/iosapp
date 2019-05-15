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
    
    var ListArray = ["Список1", "Список2", "Список3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        
        var listArray = ListArray[indexPath.row]
        
        cell.listName.text = listArray
        cell.onDeletePressed = {
            [weak self] index in
            self?.ListArray.remove(at: indexPath.row)
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
            if (!ListArray.contains(listTextField!.text!) || ListArray[indexPath.row] == listTextField!.text!) && listTextField!.text! != "" {
                ListArray[indexPath.row] = listTextField!.text!
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
    
    @IBAction func createButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Добавить новый список?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: newTextField)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func newTextField(textField: UITextField!) {
        listTextField = textField
        listTextField?.placeholder = "Новый список"
    }
    
    func newOkHandler(alert: UIAlertAction!) {
        if !ListArray.contains(listTextField!.text!) && listTextField!.text! != "" {
            ListArray.append(listTextField!.text!)
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
    }


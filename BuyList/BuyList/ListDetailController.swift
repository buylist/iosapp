//
//  ListDetailController.swift
//  BuyList
//
//  Created by Boris Botov on 07/06/2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit
import RealmSwift

class ListDetailController: UITableViewController {
    
    var list: Results<ListGet>? = DatabaseService.get(ListGet.self)
    var listName = ""
    let checklistService = ChecklistService()
    
    @IBAction func addButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Добавить новый продукт?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addTextField(configurationHandler: newTextField)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
        
//        func newTextField(textField: UITextField!) {
//            listTextField = textField
//            listTextField?.placeholder = "Новый список"
//        }
//
//        func newOkHandler(alert: UIAlertAction!) {
//            sections[section].items.insert(Item.init(name: listTextField!.text!), at: 0)
//            tableView.reloadData()
//        }
    }
    
    @IBAction func shablonButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выберите шаблон:", message: nil, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        alertController.addTextField(configurationHandler: newTextField)
//        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    @IBAction func riciptButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Выберите рецепт:", message: nil, preferredStyle: .alert)
        //        let okAction = UIAlertAction(title: "Добавить", style: .default, handler: newOkHandler)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        //        alertController.addTextField(configurationHandler: newTextField)
        //        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    func newTextField(textField: UITextField!) {
        listTextField = textField
        listTextField?.placeholder = "Введите название"
    }
    func newOkHandler(alert: UIAlertAction!) {
        listArray.insert(listTextField!.text!, at: 0)
        tableView.reloadData()
    }
    
    var listTextField: UITextField?
    
    var listArray = ["Морковь", "Лук", "Вода"]
    var listInt = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let headerNib = UINib.init(nibName: "HeaderList", bundle: Bundle.main)
//        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderList")
//
//        let footerNib = UINib.init(nibName: "FooterList", bundle: Bundle.main)
//        tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "FooterList")
    }
}

extension ListDetailController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return list?.filter("name_List == '\(listName)'").count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let listDetail = list?.filter("name_List == '\(listName)'")
        let checklistsUrl = listDetail![indexPath.row].url_Checklists[indexPath.row]
        
        if listDetail![indexPath.row].deleted_Checklists[indexPath.row] {
//            checklistService.loadListChecklistPatch(url: checklistsUrl, deleted: false)
            print(listDetail![indexPath.row].deleted_Checklists[indexPath.row])
        } else {
//            checklistService.loadListChecklistPatch(url: checklistsUrl, deleted: true)
            print(listDetail![indexPath.row].deleted_Checklists[indexPath.row])
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListDetailCell = tableView.dequeueReusableCell(withIdentifier: "ListDetailCell") as! ListDetailCell
        
        let listDetail = list?.filter("name_List == '\(listName)'")
        cell.listName.text = listDetail![indexPath.row].name_Item[indexPath.row]
        
        if listDetail![indexPath.row].deleted_Checklists[indexPath.row] {
            cell.listName.textColor = UIColor.red
        } else {
            cell.listName.textColor = UIColor.black
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = editAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .destructive, title: "Удалить") {
            (action, view, complection) in
            self.listArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
        
        action.backgroundColor = UIColor.red
        
        return action
    }
    
    func editAction(at indexPath: IndexPath) -> UIContextualAction {
        
        var list = listArray[indexPath.row]
        
        let action = UIContextualAction(style: .destructive, title: "Ред.") {
            (action, view, complection) in
            
            let alertController = UIAlertController(title: "Изменить название?", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addTextField(configurationHandler: editTextField)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true)
        }
        
        func editTextField(textField: UITextField!) {
            listTextField = textField
            listTextField?.placeholder = list
        }
        
        func editOkHandler(alert: UIAlertAction!) {
            listArray[indexPath.row] = listTextField!.text!
            tableView.reloadData()
        }
        
        action.backgroundColor = UIColor.gray
        
        return action
    }
    
    @IBAction func buttonClose(_ sender: Any ) {
        
    }
    
}

//
//  ViewController.swift
//  BuyList
//
//  Created by Boris Botov on 13.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit
import RealmSwift

class ListController: UITableViewController {
    
    var listTextField: UITextField?
    
    var sections = sectionData1
    
//    var sectionsData: [Section1] = [
    //    Section1(name: "Коллекция списков", items: [
    //        Item1(name: "Ашан"),
    //        Item1(name: "Косметика")
    //        ]),
    //    Section1(name: "Шаблоны", items: [
    //        Item1(name: "Вечеринка"),
    //        Item1(name: "Бытовая")
    //        ]),
    //    Section1(name: "Рецепты", items: [
    //        Item1(name: "Наполеон"),
    //        Item1(name: "Драники")
    //        ])
    //]
    var listSectionImages = [0: #imageLiteral(resourceName: "списки"), 1: #imageLiteral(resourceName: "шаблоны"), 2: #imageLiteral(resourceName: "рецепты")]
    
    var list: Results<ListGet>? = DatabaseService.get(ListGet.self)
    var notificationToken: NotificationToken?
    
    var temp = [String]()
    
    let listService = ListService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        notificationToken = list?.observe { [weak self] changes in
//            self?.tableView.reloadData()
//        }
//
//                notificationToken = list?.observe { [weak self] changes in
//                    guard let self = self else { return }
//                    switch changes {
//                    case .initial(_):
//                        self.tableView.reloadData()
//                    case .update(_, let dels, let ins, let mods):
//                        self.tableView.applyChanges(deletions: dels, insertions: ins, updates: mods)
//                    case .error(let error):
//                        print(error.localizedDescription)
//                    }
//                }

        
        let headerNib = UINib.init(nibName: "HeaderList", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderList")
        
        let footerNib = UINib.init(nibName: "FooterList", bundle: Bundle.main)
        tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "FooterList")
        
        listService.loadListListGet() { [weak self] list, error in
            guard let _ = self, error == nil,
                let list = list else { print(error?.localizedDescription as Any); return }
            
//            let realm = try? Realm()
//            try? realm?.write {
//                if self.list != nil {
//                    realm?.delete(self.list!)
//                }
//            }
            
            try? DatabaseService.save(list, update: true)
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.tableView.reloadData()

//        notificationToken = list?.observe { [weak self] changes in
//            guard let self = self else { return }
//            switch changes {
//            case .initial(_):
//                self.tableView.reloadData()
//            case .update(_, let dels, let ins, let mods):
//                self.tableView.applyChanges(deletions: dels, insertions: ins, updates: mods)
//            case .error(let error):
//                print(error.localizedDescription)
//            }
//        }
    }

}

extension ListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : (list?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell ??
            ListCell(style: .default, reuseIdentifier: "ListCell")
        
//        var item: Item1 = sections[indexPath.section].items[indexPath.row]
        
        var item1 = sections[0]
        
        let listt = list?[indexPath.row]
        
        item1.name = (listt?.name_List)!
        
        cell.listName.text = item1.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderList") as? HeaderList ?? HeaderList(reuseIdentifier: "HeaderList")
        
        headerView.headerName.text = sections[section].name
        headerView.headerImage.image = listSectionImages[section]
        
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
//            sections[section].items.insert(Item1.init(name: listTextField!.text!), at: 0)
            listService.loadListListPost(name: listTextField!.text!, checklist_id: Int.random(in: 1...1000))
            
//            let realm = try? Realm()
//
//            try realm.write {
//                realm.add(listTextField!.text!, update: true)
//            }
        }

        headerView.index = section
        headerView.delegate = self
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterList") as! FooterList

        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let collapsed = !sections[section].collapsed
        if collapsed == true {
            return 28
        } else {
            return 2
        }
    }
    
}

extension ListController: HeaderListDelegate {
    
    func toggleSection(_ header: HeaderList, section: Int) {
        let collapsed = !sections[section].collapsed
        
        sections[section].collapsed = collapsed
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}


//class ListController: UITableViewController {
//
//    var listTextField: UITextField?
//
//    var ListSectionArray = [0: "Коллекция списков", 1: "Шаблоны", 2: "Рецепты"]
//    var listSectionImages = [0: #imageLiteral(resourceName: "списки"), 1: #imageLiteral(resourceName: "шаблоны"), 2: #imageLiteral(resourceName: "рецепты")]
//    var ListArray = [0: ["Список1", "Список2", "Список3"], 1: ["Шаблон1", "Шаблон2", "Шаблон3"], 2: ["Рецепт1", "Рецепт2", "Рецепт3"]]
//    var ListOpen = [0: false, 1: false , 2: false]
//
//    override func viewDidLoad() {
//
//        let headerNib = UINib.init(nibName: "HeaderList", bundle: Bundle.main)
//        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderList")
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return ListSectionArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (ListArray[section]?.count)!
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if ListOpen[indexPath.section]! {
//            return 80
//        } else {
//            return 0
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 120
//    }
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderList") as! HeaderList
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
//
//        headerView.headerName.text = ListSectionArray[section]
//        headerView.headerImage.image = listSectionImages[section]
//
//        func listOpen() {
//            if ListOpen[section]! {
//                ListOpen[section] = false
//            } else {
//                ListOpen[section] = true
//            }
//        }
//
//        headerView.onHeaderOpenCellPressed = {
//            [weak self] index in
//
//            listOpen()
//            self?.tableView.reloadData()
//        }
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
//            if !(ListArray[section]?.contains(listTextField!.text!))! && listTextField!.text! != "" {
//                ListArray[section]?.insert(listTextField!.text!, at: 0)
//                tableView.reloadData()
//            } else if  listTextField!.text! == "" {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            } else {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Список с таким название уже существует.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            }
//        }
//
//        return headerView
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        var cell111: UITableViewCell!
////        if indexPath.row == 0 {
////            cell111 = tableView.dequeueReusableCell(withIdentifier: "qqq", for: indexPath)
////        } else if indexPath.row != 0 {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
////        cell111 = cell
//
//        var listArray = ListArray[indexPath.section]?[indexPath.row]
//
//        cell.listName.text = listArray
//
////        if indexPath.row == 0 {
////            cell111 = tableView.dequeueReusableCell(withIdentifier: "qqq")
////            var cell2 = tableView.dequeueReusableCell(withIdentifier: "qqq")
////            return cell2!
////        }
//
//        cell.onDeletePressed = {
//            [weak self] index in
//            self?.ListArray[indexPath.section]?.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
//        }
//
//        cell.onEditPressed = {
//            [weak self] index in
//
//            let alertController = UIAlertController(title: "Изменить название списка?", message: nil, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
//            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//            alertController.addTextField(configurationHandler: editTextField)
//            alertController.addAction(okAction)
//            alertController.addAction(cancelAction)
//
//            self?.present(alertController, animated: true)
//        }
//
//        func editTextField(textField: UITextField!) {
//            listTextField = textField
//            listTextField?.placeholder = listArray
//        }
//
//        func editOkHandler(alert: UIAlertAction!) {
//            if (!(ListArray[indexPath.section]?.contains(listTextField!.text!))! || ListArray[indexPath.section]?[indexPath.row] == listTextField!.text!) && listTextField!.text! != "" {
//                ListArray[indexPath.section]?[indexPath.row] = listTextField!.text!
//                tableView.reloadData()
//            } else if listTextField!.text! == "" {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            } else {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Список с таким название уже существует.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            }
//        }
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let edit = editAction(at: indexPath)
//        let delete = deleteAction(at: indexPath)
//        return UISwipeActionsConfiguration(actions: [delete, edit])
//    }
//
//    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
//
//        let action = UIContextualAction(style: .destructive, title: "Удалить") {
//            (action, view, complection) in
//            self.ListArray[indexPath.section]?.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .fade)
//            self.tableView.reloadData()
//        }
//
//        action.backgroundColor = UIColor.red
//
//        return action
//    }
//
//    func editAction(at indexPath: IndexPath) -> UIContextualAction {
//
//        var listArray = ListArray[indexPath.section]?[indexPath.row]
//
//        let action = UIContextualAction(style: .destructive, title: "Ред.") {
//            (action, view, complection) in
//
//            let alertController = UIAlertController(title: "Изменить название списка?", message: nil, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "Изменить", style: .default, handler: editOkHandler)
//            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//            alertController.addTextField(configurationHandler: editTextField)
//            alertController.addAction(okAction)
//            alertController.addAction(cancelAction)
//
//            self.present(alertController, animated: true)
//        }
//
//        func editTextField(textField: UITextField!) {
//            listTextField = textField
//            listTextField?.placeholder = listArray
//        }
//
//        func editOkHandler(alert: UIAlertAction!) {
//            if (!(ListArray[indexPath.section]?.contains(listTextField!.text!))! || ListArray[indexPath.section]?[indexPath.row] == listTextField!.text!) && listTextField!.text! != "" {
//                ListArray[indexPath.section]?[indexPath.row] = listTextField!.text!
//                tableView.reloadData()
//            } else if listTextField!.text! == "" {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Пустое название.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            } else {
//                let alertController = UIAlertController(title: "Ошибка!", message:  "Список с таким название уже существует.", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
//                alertController.addAction(okAction)
//                self.present(alertController, animated: true)
//            }
//        }
//
//        action.backgroundColor = UIColor.orange
//
//        return action
//    }
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////
////        if segue.identifier == "recipeArray" {
////            if let recipeController = segue.destination as? RecipeController {
//////                let indexPath = tableView.indexPathForSelectedRow
////                recipeController.RecipeName = ListArray[2]!
////            }
////        }
////    }
//}

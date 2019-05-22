//
//  RecipeController.swift
//  BuyList
//
//  Created by Andrey Vorobyv on 21.05.2019.
//  Copyright © 2019 WORTUS Inc. All rights reserved.
//

import UIKit

class RecipeController: UITableViewController {
    
    var RecipeName = ["Рецепттт1", "Рецепттт2", "Рецепттт3"]
    
    override func viewDidLoad() {
//        let headerNib = UINib.init(nibName: "HeaderRecipe", bundle: Bundle.main)
//        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderRecipe")
        
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderRecipe") as! HeaderRecipe
//
//        return headerView
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return RecipeName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        
        cell.recipeName.text = RecipeName[indexPath.row]
        
        return cell
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {

        dismiss(animated: true, completion: nil)
    }
}

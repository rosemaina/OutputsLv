//
//  FruitsTableViewController.swift
//  output11
//
//  Created by Ace on 23/11/2017.
//  Copyright © 2017 Ace. All rights reserved.
//

import UIKit

class FruitsTableViewController: UITableViewController {

        var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                      "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                      "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                      "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                      "Pear", "Pineapple", "Raspberry", "Strawberry"]
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows array has without adding more
        return fruits.count
    }

//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelFruitCell", for: indexPath)
        let fruitName = fruits[indexPath.row]
        
        cell.textLabel?.text = fruitName
        cell.detailTextLabel?.text = "This is delicious"
        cell.imageView?.image = UIImage(named: fruitName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

}

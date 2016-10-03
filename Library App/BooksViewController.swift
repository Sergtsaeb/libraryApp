//
//  BooksViewController.swift
//  Library App
//
//  Created by Sergelenbaatar Tsogtbaatar on 10/1/16.
//  Copyright © 2016 Sergts. All rights reserved.
//

import UIKit

class BooksViewController: UITableViewController {

    var shelf: [String: AnyObject]!
    let CellIdentifier = "Cell Identifier"
    
    var books: [AnyObject] {
        if let books = shelf["Books"] as? [AnyObject] {
            return books
        } else {
            return [AnyObject]()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = shelf["shelf"] as? String {
            title = name
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Deqeue reuasable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        if let book = books[indexPath.row] as? [String: String], let title = book["Title"] {
            // Configure Cell
            cell.textLabel?.text = title
            
            
        }
        return cell
    }
    
    
}

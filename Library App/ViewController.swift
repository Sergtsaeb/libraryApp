//
//  ViewController.swift
//  Library App
//
//  Created by Sergelenbaatar Tsogtbaatar on 9/22/16.
//  Copyright © 2016 Sergts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var shelves = [AnyObject]()
    
    let SegueBooksViewController = "BooksViewController"
    let CellIdentifier = "Cell Identifier"
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Library"
        
        self.setupUI()
        
        let filePath = Bundle.main.path(forResource: "TableData", ofType: "plist")
        if let path = filePath {
            shelves = NSArray(contentsOfFile: path) as! [AnyObject]
            print(shelves)
        }
    
    }

    func setupUI() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    //Datasource delegations
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shelves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier: String = "myCell"
        var cell = tableview.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        
        if let shelf = shelves[indexPath.row] as? [String: AnyObject], let name = shelf["Shelf"] as? String {
            // Configure Cell
            cell?.textLabel?.text = name
        }
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at \(indexPath.row)")
        performSegue(withIdentifier: SegueBooksViewController, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueBooksViewController {
            if let indexPath = tableview.indexPathForSelectedRow, let shelf = shelves[indexPath.row] as? [String: AnyObject] {
                let destinationViewController = segue.destination as! BooksViewController
                destinationViewController.shelf = shelf
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
}


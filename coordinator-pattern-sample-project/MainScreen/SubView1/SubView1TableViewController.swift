//
//  SubView1TableViewController.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 23/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class SubView1TableViewController: UITableViewController {
    
    private let tableViewTapped: ((String)->())
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, withAction tableViewTapped: @escaping ((String) -> ())) {
        self.tableViewTapped = tableViewTapped
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Cell \(indexPath.row)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath), let cellTitle = cell.textLabel?.text else {
            return
        }
        
        tableViewTapped(cellTitle)
    }
    
}


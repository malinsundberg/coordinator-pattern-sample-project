//
//  DetailViewController.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 24/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let titleText: String

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, with titleText: String) {
        self.titleText = titleText
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        titleLabel.text = titleText
    }
}

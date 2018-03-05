//
//  MainViewViewController.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 22/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class MainViewViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    let button1Tapped: (()->())
    let button2Tapped: (()->())
    
    @IBAction func button1Action(_ sender: UIButton) {
        button1Tapped()
    }
    
    @IBAction func button2Action(_ sender: UIButton) {
        button2Tapped()
    }
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, button1Action: @escaping (()->()), button2Action: @escaping (()->())) {
        self.button1Tapped = button1Action
        self.button2Tapped = button2Action
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

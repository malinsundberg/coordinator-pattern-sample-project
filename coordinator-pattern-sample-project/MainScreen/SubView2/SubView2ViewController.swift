//
//  SubView2ViewController.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 25/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

import UIKit

class SubView2ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBAction func DetailsButtonAction(_ sender: UIButton) { buttonAction() }
    
    private let titleText: String
    private let subTitleText: String
    private let buttonAction: (() -> ())
    private let cancelButtonAction: (() -> ())
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, withText titleText: String, and subTitleText: String, withAction buttonAction: @escaping (() -> ()), and cancelButtonAction: @escaping (() -> ())) {
        self.titleText = titleText
        self.subTitleText = subTitleText
        self.buttonAction = buttonAction
        self.cancelButtonAction = cancelButtonAction
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        subTitleLabel.text = subTitleText
    }

}

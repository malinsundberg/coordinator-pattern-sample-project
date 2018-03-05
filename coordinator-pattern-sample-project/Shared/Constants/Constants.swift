//
//  Constants.swift
//  coordinator-pattern-sample-project
//
//  Created by Malin Sundberg on 26/12/17.
//  Copyright © 2017 Malin Sundberg. All rights reserved.
//

enum Constants {
    
    enum CoordinatorKeys: String {
        case mainViewCoordinator
        case subView1Coordinator
        case subView2Coordinator
    }
    
    enum Nibs {
        static let mainViewViewController = "MainViewViewController"
        static let subView1TableViewController = "SubView1TableViewController"
        static let subView2ViewController = "SubView2ViewController"
        static let detailViewController = "DetailViewController"
    }
    
    enum Storyboards {
        static let detailTableView = "DetailTableView"
        
        enum StoryboardIdentifiers {
            static let detailTableView = "DetailTableView"
        }
    }
    
}

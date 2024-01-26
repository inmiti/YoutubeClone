//
//  MainViewController.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import UIKit

class MainViewController: UIViewController {
    var rootPageViewController: RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            rootPageViewController = destination
        }
    }
    



}

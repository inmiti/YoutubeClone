//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeViewController: HomeViewProtocol{
    func getData(list: [[Any]]) {
        print("list:", list)
    }
    
    
}

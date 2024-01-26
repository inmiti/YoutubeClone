//
//  RootPageViewController.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import UIKit

class RootPageViewController: UIPageViewController {
     
    var subViewControllers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelsViewController(),
            AboutViewController()
        ]
        
        setViewControllerFromIndex(index: 0, direction: .forward)
    }
    
    func setViewControllerFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true) {
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
   
}

//MARK: - Delegate and Data Source
extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int { // Da el numero de vistas
        return subViewControllers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {    //Le decimos cual es el controler próximo
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0{  // Si es la primera vista retorna nil porque no hay mas alla, no hacer swipe
            return nil
        }
        return subViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {   //Le decimos cual es el controller previo
        let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= (subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[index+1]
    }
}

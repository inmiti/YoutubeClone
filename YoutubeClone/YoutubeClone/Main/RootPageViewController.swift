//
//  RootPageViewController.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import UIKit

protocol RootPageProtocol: AnyObject{
    func currentPage(_ index: Int)
}

class RootPageViewController: UIPageViewController {
     
    var subViewControllers = [UIViewController]()
    var currentIndex: Int = 0
    
    weak var delegateRoot: RootPageProtocol?
    
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
        
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset }) // Me da cada elemento de la lista con su indice. Se asigna a cada tag el offset que es un entero, su indice.
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
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let index = pageViewController.viewControllers?.first?.view.tag{
            currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
}

//
//  RootPageViewController.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 28/04/23.
//

import UIKit

protocol RootPageProtocolo: AnyObject {
    func currentPage(_ index: Int)
}

class RootPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    var subViewControllers: [UIViewController] = []
    var currentIndex: Int = 0
    weak var delegateRoot: RootPageProtocolo?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        setUpViewControllers()
    }
    
    // MARK: - Methods
    
    /// Method to charge the all subviews in subViewControllers array
    private func setUpViewControllers() {
        subViewControllers = [HomeViewController(),
                              VideosViewController(),
                              PlaylistsViewController(),
                              ChannelsViewController(),
                              AboutViewController()]
        
        _ = subViewControllers.enumerated().map { $0.element.view.tag = $0.offset}  // Sirve para agregar un tag a cada viewcontroller de la coleccion subViewControllers
        
        setViewControllersFromIndex(index: 0, direction: .forward)  // First view controller to be displayed is HomeViewController() or zero position in the array
        
    }
    
    /// Sets the view controllers to be displayed
    /// - Parameters:
    ///   - index: The view controller position to be displayed.
    ///   - direction: The navigation direction
    ///   - animated: A Boolean value that indicates whether the transition is to be animated, by default is true.
    public func setViewControllersFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true) {
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }

}

    // MARK: - UIPageViewControllerDelegate, UIPageViewControllerDataSource

extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = subViewControllers.firstIndex(of: viewController) ?? 0  // Position of each view controller
        if index <= 0 {
            return nil
        }
        return subViewControllers[index-1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= (subViewControllers.count - 1) {
            return nil
        }
        return subViewControllers[index+1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        print("Finished", finished)
        
        if let index = pageViewController.viewControllers?.first?.view.tag {
            // Bloque para obtener la posicion actual del view controller a desplegar
            currentIndex = index
            delegateRoot?.currentPage(index)    // Pasar el index a otro view controller (MainViewController)
        }
        
    }
    
}

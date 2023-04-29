//
//  MainViewController.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 28/04/23.
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
            rootPageViewController = destination    // Se instancia RootPageViewController
        }
    }

}

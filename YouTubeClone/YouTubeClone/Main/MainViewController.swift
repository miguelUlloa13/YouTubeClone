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
            destination.delegateRoot = self // Se delega la funcion de obtener el viewcontroller que se desplega a RootPageViewController
            rootPageViewController = destination    // Se instancia RootPageViewController
        }
    }

}

extension MainViewController: RootPageProtocolo {
    func currentPage(_ index: Int) {
        print("Current page:", index)
    }
    
    
}

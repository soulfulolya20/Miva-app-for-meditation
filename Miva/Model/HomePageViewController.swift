//
//  HomePageViewController.swift
//  Miva
//
//  Created by Admin on 5/2/22.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home")
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      //  self.tabBarController?.tabBar.isHidden = false
    }

}

private extension HomePageViewController {
    
    func setUp() {
        self.navigationItem.hidesBackButton = true
    }
    
    
}

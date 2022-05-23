//
//  HomeDetailsViewController.swift
//  Miva
//
//  Created by Георгий Бутров on 23.05.2022.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    
    required init(name: String) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
        setUpUI()
    }
    
    func setUpUI() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
            ])
    }
}

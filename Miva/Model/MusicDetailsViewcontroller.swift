//
//  MusicDetailsViewcontroller.swift
//  Miva
//
//  Created by Георгий Бутров on 23.05.2022.
//

import UIKit

class MusicDetailsViewController: UIViewController {
    var poster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 100
        image.contentMode = .scaleToFill
        return image
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor(red: 0.287, green: 0.287, blue: 0.287, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    required init(title: String, imageName: String) {
        super.init(nibName: nil, bundle: nil)
        poster.image = UIImage(named: imageName)
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        view.backgroundColor = UIColor(red: 0.898, green: 0.843, blue: 0.808, alpha: 1)
    }
    
    func setUpUI() {
        view.addSubview(poster)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            poster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            poster.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            poster.widthAnchor.constraint(equalToConstant: 200),
            poster.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 40)
        ])
    }
}
